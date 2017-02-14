#include <enet/enet.h>

#include <zip.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/stat.h>

ENetHost* setup_host() {
    // Initialize ENet.
    if (enet_initialize() != 0) {
        printf("An error occurred while initializing ENet.\n");
        exit(EXIT_FAILURE);
    }

    ENetHost *host = enet_host_create (NULL /* create a client host */,
        1 /* only allow 1 outgoing connection */,
        2 /* allow up 2 channels to be used, 0 and 1 */,
        57600 / 8 /* 56K modem with 56 Kbps downstream bandwidth */,
        14400 / 8 /* 56K modem with 14 Kbps upstream bandwidth */);
    if (host == NULL) {
        fprintf (stderr, 
            "An error occurred while trying to create an ENet client host.\n");
        exit (EXIT_FAILURE);
    }

    return host;
}

ENetPeer* setup_network(ENetHost *host, ENetAddress address) {
    enet_address_set_host(&address, "localhost");
    address.port = 7000;

    ENetPeer *peer = enet_host_connect(host, &address, 2, 0);
    if (peer == NULL) {
        fprintf (stderr, 
            "No available peers for initiating an ENet connection.\n");
        exit (EXIT_FAILURE);
    }
   
    ENetEvent event;
    if (enet_host_service(host, &event, 5000) > 0 &&
        event.type == ENET_EVENT_TYPE_CONNECT) {
        printf("Connection succeded.\n");
    } else {
        enet_peer_reset(peer);
        printf("Connection failed");
        return NULL;
    }

    return peer;
}

static int get_data(void **datap, size_t *sizep, const char *archive) {
    /* example implementation that reads data from file */
    struct stat st;
    FILE *fp;

    if (stat(archive, &st) < 0) {
	if (errno != ENOENT) {
	    fprintf(stderr, "can't stat %s: %s\n", archive, strerror(errno));
	    return -1;
	}

	*datap = NULL;
	*sizep = 0;
	
	return 0;
    }

    if ((*datap = malloc((size_t)st.st_size)) == NULL) {
	fprintf(stderr, "can't allocate buffer\n");
	return -1;
    }

    if ((fp=fopen(archive, "r")) == NULL) {
	free(*datap);
	fprintf(stderr, "can't open %s: %s\n", archive, strerror(errno));
	return -1;
    }
    
    if (fread(*datap, 1, (size_t)st.st_size, fp) < (size_t)st.st_size) {
	free(*datap);
	fprintf(stderr, "can't read %s: %s\n", archive, strerror(errno));
	fclose(fp);
	return -1;
    }

    fclose(fp);

    *sizep = (size_t)st.st_size;
    return 0;
}

int send_zip(const char *file, ENetPeer *peer, ENetHost *host) {
    zip_source_t *src;
    zip_t *za;
    zip_error_t error;
    void *data;
    size_t size;

    if (file == NULL) {
	    fprintf(stderr, "Wrong file.\n");
	    return 1;
    }

    /* get buffer with zip archive inside */
    if (get_data(&data, &size, file) < 0) {
	    return 1;
    }
    
    ENetPacket *packet = enet_packet_create(data, size,
        ENET_PACKET_FLAG_RELIABLE);
    enet_peer_send(peer, 0, packet);
    enet_host_flush(host);

    zip_error_init(&error);
    /* create source from buffer */
    if ((src = zip_source_buffer_create(data, size, 1, &error)) == NULL) {
	    fprintf(stderr, "can't create source: %s\n", zip_error_strerror(&error));
	    free(data);
	    zip_error_fini(&error);
	    return 1;
    }

    /* open zip archive from source */
    if ((za = zip_open_from_source(src, 0, &error)) == NULL) {
	    fprintf(stderr, "can't open zip from source: %s\n", zip_error_strerror(&error));
	    zip_source_free(src);
	    zip_error_fini(&error);
	    return 1;
    }
    zip_error_fini(&error);
    
    zip_stat_t zst;

	if (zip_source_stat(src, &zst) < 0) {
	    fprintf(stderr, "can't stat source: %s\n", zip_error_strerror(zip_source_error(src)));
	    return 1;
	}

	size = zst.size;

	zip_source_close(src);
	
	/* we're done with src */
    zip_source_free(src);
}

int main(int argc, char *argv[]) {
    const char *archive;
    if (argc < 2) {
        fprintf(stderr, "usage: %s archive\n", argv[0]);
        return 1;
    }
    archive = argv[1];

    ENetHost *pClient = setup_host();
    
    ENetAddress address;
    ENetPeer *peer = setup_network(pClient, address);

    send_zip(archive, peer, pClient);
    
    /* We've arrived here, so the disconnect attempt didn't */
    /* succeed yet.  Force the connection down.             */
    enet_peer_disconnect (peer, 0);

    // Close the client.
    enet_host_destroy(pClient);    
    // Deinitialize ENet.
    enet_deinitialize();
    return 0;
}


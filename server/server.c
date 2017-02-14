#define _XOPEN_SOURCE 500

#include <enet/enet.h>

#include <zip.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
//#include <sys/syslimits.h>
#include <ftw.h>
#include <errno.h>

static void safe_create_dir(const char *dir)
{
    if (mkdir(dir, 0755) < 0) {
        if (errno != EEXIST) {
            perror(dir);
            exit(1);
        }
    }
}

/* Call unlink or rmdir on the path, as appropriate. */
int rm( const char *path, const struct stat *s, int flag, struct FTW *f ) {
    int status;
    int (*rm_func)( const char * );

    switch( flag ) {
        default:     rm_func = unlink; break;
        case FTW_DP: rm_func = rmdir;
    }
    
    if( status = rm_func( path ), status != 0 ) {
        perror( path );
    } else {
        //puts( path );
    }
    return status;
}

int unzip_project(zip_t *za, zip_stat_t zst, const char *folder) {
    zip_stat_t sb;
    struct zip_file *zf;
    int fd;
    int len;
    long long sum;
    char buf[100];
    int i;
    char *file;

    for (i = 0; i < zip_get_num_entries(za, 0); i++) {
        if (zip_stat_index(za, i, 0, &sb) == 0) {
            printf("Unzipping.\n");
            len = strlen(sb.name);
            if (sb.name[len - 1] == '/') {
                safe_create_dir(sb.name);
            } else {
                zf = zip_fopen_index(za, i, 0);
                if (!zf) {
                    fprintf(stderr, "can't open file at index %i/n", i);
                    exit(100);
                }

                file = (char*)malloc(strlen(sb.name) + strlen(folder) + 1);
                strcpy(file, folder);
                strcat(file, "/");
                strcat(file, sb.name);

                printf("%s\n", file);

                fd = open(file, O_RDWR | O_TRUNC | O_CREAT, 0644);
                if (fd < 0) {
                    fprintf(stderr, "can't load %s file./n", sb.name);
                    exit(101);
                }
 
                sum = 0;
                while (sum != sb.size) {
                    len = zip_fread(zf, buf, 100);
                    if (len < 0) {
                        fprintf(stderr, "can't free zip memory./n");
                        exit(102);
                    }
                    write(fd, buf, len);
                    sum += len;
                }
                close(fd);
                zip_fclose(zf);
            }
        } else {
            printf("File[%s] Line[%d]/n", __FILE__, __LINE__);
        }
    }

    free(file);
}

int launch_compilation(void *data, size_t size, const char *folder) {
    zip_source_t *src;
    zip_t *za;
    zip_error_t error;

    zip_error_init(&error);
    /* create source from buffer */
    if ((src = zip_source_buffer_create((char*)data, size, 1, &error)) == NULL) {
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

    printf("Unzip the project.\n");

    unzip_project(za, zst, folder);

    printf("Build the project.\n");

    char make[] = "make -C ";
    char *command = (char*)malloc(strlen(folder) + strlen(make));
    strcpy(command, make);
    strcat(command, folder);
    
    system(command);

    free(command);

	zip_source_close(src);
	
	/* we're done with src */
    zip_source_free(src);
}

int main(int argc, char *argv[]) {
    // Initialize ENet.
    if (enet_initialize() != 0) {
        fprintf(stderr, "An error occurred while initializing ENet.\n");
        exit(EXIT_FAILURE);
    }

    ENetAddress address;
    ENetHost *pServer;

    /* Bind the server to the default localhost.
     * A specific host address can be specified by
     * enet_address_set_host(&address, "x.x.x.x");
     */
    address.host = ENET_HOST_ANY;
    // Bind the server to port 27155.
    address.port = 7000;

    pServer = enet_host_create(&address /* the address to bind the server host to */,
        32 /* allow up to 32 clients and/or outgoing connections */,
        2 /* allow up to 2 channels to be used, 0 and 1 */,
        0 /* assume any amount of incoming bandwidth */,
        0 /* assume any amount of outgoing bandwidth */);

    if (pServer == NULL) {
        fprintf(stderr, "An error occurred while trying to create an ENet server host.\n");
        exit(EXIT_FAILURE);
    }

    ENetEvent event;
    /* Wait up to 5000 milliseconds for an event. */
    while (1) {
        if (enet_host_service(pServer, &event, 0) > 0) {
            printf("Event %u\n", event.type);
            switch (event.type) {
                case ENET_EVENT_TYPE_CONNECT:
                    printf("A new client connected from %x:%u.\n", 
                           event.peer->address.host,
                           event.peer->address.port);
                    /* Store any relevant client information here. */
                    event.peer->data = "Client information";
                    break;
                case ENET_EVENT_TYPE_RECEIVE:
                    printf("A packet of length %zu containing %s was received from %s on channel %u.\n",
                           event.packet->dataLength,
                           (char*)event.packet->data,
                           (char*)event.peer->data,
                           event.channelID);
                    /* Clean up the packet now that we're done using it. */

                    char *folder = (char*)malloc(sizeof(event.peer->address.host)+2);
                    sprintf(folder,"./%x", event.peer->address.host);
                    safe_create_dir(folder);

                    launch_compilation(event.packet->data, event.packet->dataLength, folder);

                    printf("Remove the temporal folder.\n");
                    if (nftw(folder, rm, 10, FTW_DEPTH)) {
                        fprintf(stderr, "Fail to remove folder.");
                        return 128;
                    }
                    free(folder);

                    //enet_packet_destroy (event.packet);
                    
                    break;
                case ENET_EVENT_TYPE_DISCONNECT:
                    printf("%s disconnected.\n", (char*)event.peer->data);
                    /* Reset the peer's client information. */
                    event.peer -> data = NULL;
                    
                    break;
                case ENET_EVENT_TYPE_NONE:
                default:
                    printf("Wrong type of event.\n");
                    break;
            }
        }
    }

    // Close the server.
    enet_host_destroy(pServer);
    // Deinitialize ENet.
    atexit(enet_deinitialize);
    return 0;
}

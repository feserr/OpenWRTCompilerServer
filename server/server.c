#define _XOPEN_SOURCE 500

#include <enet/enet.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
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

int launch_compilation(void *data, size_t size, const char *folder) {
    char *file = (char*)malloc(strlen("/project.zip") + strlen(folder) + 1);
    strcpy(file, folder);
    strcat(file, "/project.zip");

    int fd = open(file, O_RDWR | O_TRUNC | O_CREAT, 0644);
    if (fd < 0) {
        fprintf(stderr, "can't load %s file.\n", file);
        exit(101);
    }

    //free(file);
    
    write(fd, data, size);

    close(fd);

    printf("Unzip the project.\n");

    char unzip[] = "unzip ";
    char *commandUnzip = (char*)malloc(strlen("/project.zip -d ") + strlen(unzip) + 
        strlen(folder) + strlen(folder) + 1);
    strcpy(commandUnzip, unzip);
    strcat(commandUnzip, folder);
    strcat(commandUnzip, "/project.zip -d ");
    strcat(commandUnzip, folder);
    
    //system(commandUnzip);
    FILE *fp = popen(commandUnzip, "r");
    char buf[256];
    while (fgets(buf, 256, fp) != NULL) {
        //printf("OUTPUT: %s", buf);
    }
    pclose(fp);

    free(commandUnzip);

    printf("Build the project.\n");

    char make[] = "make -C ";
    char *command = (char*)malloc(strlen(folder) + strlen(make) + strlen(" 2>&1") + 1);
    strcpy(command, make);
    strcat(command, folder);
    strcat(command, " 2>&1");
    
    fp = popen(command, "r");

    while (fgets(buf, 256, fp) != NULL) {
        //printf("%s\n", buf);
        char *e = "Error";
        if (strstr(e, buf) != NULL) {
            pclose(fp);
            free(command);
            free(file);
            return 0;
        }
    }
    
    pclose(fp);

    free(command);

    return 1;
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
            switch (event.type) {
                case ENET_EVENT_TYPE_CONNECT:
                    printf("A new client connected from %x:%u.\n", 
                           event.peer->address.host,
                           event.peer->address.port);
                    /* Store any relevant client information here. */
                    event.peer->data = "Client information";
                    break;
                case ENET_EVENT_TYPE_RECEIVE:
                {
                    char *folder = (char*)malloc(sizeof(event.peer->address.host)+3);
                    sprintf(folder,"./%x", event.peer->address.host);
                    safe_create_dir(folder);

                    int error = launch_compilation(event.packet->data, event.packet->dataLength, folder);

                    printf("Remove the temporal folder.\n");
                    if (nftw(folder, rm, 10, FTW_DEPTH)) {
                        fprintf(stderr, "Fail to remove folder.");
                        return 128;
                    }

                    //free(folder);

                    enet_packet_destroy (event.packet);

                    ENetPacket *packet;
                    if (!error) {
                        packet = enet_packet_create("error", strlen("error")+1,
                            ENET_PACKET_FLAG_RELIABLE);
                    } else {
                        packet = enet_packet_create("valid", strlen("valid")+1,
                            ENET_PACKET_FLAG_RELIABLE);
                    }
                        
                    enet_peer_send(event.peer, 0, packet);
                    enet_host_flush(pServer);
                    
                    break;
                }
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

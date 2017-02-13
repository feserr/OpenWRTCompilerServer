#include <enet/enet.h>

#include <iostream>
#include <cstdio>

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
    while (enet_host_service(pServer, &event, 5000) > 0) {
        printf("Evento del typo %u\n", event.type);
        switch (event.type) {
            case ENET_EVENT_TYPE_CONNECT:
                printf("A new client connected from %x:%u.\n", 
                       event.peer -> address.host,
                       event.peer -> address.port);
                /* Store any relevant client information here. */
                //event.peer->data = "Client information";
                break;
            case ENET_EVENT_TYPE_RECEIVE:
                printf("A packet of length %zu containing %s was received from %s on channel %u.\n",
                       event.packet->dataLength,
                       reinterpret_cast<char*>(event.packet->data),
                       reinterpret_cast<char*>(event.peer->data),
                       event.channelID);
                /* Clean up the packet now that we're done using it. */
                enet_packet_destroy (event.packet);
                
                break;
            case ENET_EVENT_TYPE_DISCONNECT:
                printf("%s disconnected.\n", reinterpret_cast<char*>(event.peer->data));
                /* Reset the peer's client information. */
                event.peer -> data = NULL;
                
                break;
            case ENET_EVENT_TYPE_NONE:
                printf("Any event to attend.\n");
                break;
            default:
            printf("Unhandler event type.n");
            break;
        }
    }

    // Close the server.
    enet_host_destroy(pServer);
    // Deinitialize ENet.
    atexit(enet_deinitialize);
    return 0;
}

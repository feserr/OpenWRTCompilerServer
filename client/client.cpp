#include <enet/enet.h>

#include <iostream>
#include <cstdio>
#include <cstring>

int main(int argc, char *argv[]) {
    // Initialize ENet.
    if (enet_initialize() != 0) {
        fprintf(stderr, "An error occurred while initializing ENet.\n");
        exit(EXIT_FAILURE);
    }

    ENetHost *pClient;
    pClient = enet_host_create (NULL /* create a client host */,
        1 /* only allow 1 outgoing connection */,
        2 /* allow up 2 channels to be used, 0 and 1 */,
        57600 / 8 /* 56K modem with 56 Kbps downstream bandwidth */,
        14400 / 8 /* 56K modem with 14 Kbps upstream bandwidth */);
    if (pClient == NULL) {
        fprintf (stderr, 
                 "An error occurred while trying to create an ENet client host.\n");
        exit (EXIT_FAILURE);
    }
    
    ENetAddress address;
    enet_address_set_host(&address, "localhost");
    address.port = 7000;

    ENetPeer *peer = enet_host_connect(pClient, &address, 2, 0);
    if (peer == NULL) {
        fprintf (stderr, 
            "No available peers for initiating an ENet connection.\n");
        exit (EXIT_FAILURE);
    }
   
    ENetEvent event;
    if (enet_host_service(pClient, &event, 5000) > 0 &&
        event.type == ENET_EVENT_TYPE_CONNECT) {
        printf("Connection succeded.\n");
    } else {
        enet_peer_reset(peer);
        printf("Connection failed");
        return 1;
    }

    /* Create a reliable packet of size 7 containing "packet\0" */
    ENetPacket *packet = enet_packet_create("packet", 
        strlen("packet") + 1, ENET_PACKET_FLAG_RELIABLE);
    /* Extend the packet so and append the string "foo", so it now */
    /* contains "packetfoo\0"                                      */
    enet_packet_resize(packet, strlen("packetfoo") + 1);
    std::strcpy(reinterpret_cast<char*>(&packet->data[std::strlen("packet")]), "foo");
    /* Send the packet to the peer over channel id 0. */
    /* One could also broadcast the packet by         */
    /* enet_host_broadcast (host, 0, packet);         */
    enet_peer_send(peer, 0, packet);

    enet_peer_disconnect (peer, 0);
    /* Allow up to 3 seconds for the disconnect to succeed
     * and drop any packets received packets.
     */
    while (enet_host_service(pClient, &event, 3000) > 0) {
        switch (event.type) {
            case ENET_EVENT_TYPE_RECEIVE:
                enet_packet_destroy(event.packet);
                break;
            case ENET_EVENT_TYPE_DISCONNECT:
                puts("Disconnection succeeded.");
                break;
            default:
                break;
        }
    }
    /* We've arrived here, so the disconnect attempt didn't */
    /* succeed yet.  Force the connection down.             */
    enet_peer_reset(peer);

    // Close the client.
    enet_host_destroy(pClient);    
    // Deinitialize ENet.
    atexit(enet_deinitialize);
    return 0;
}


HEADERS=-I../include/

all: compilerServer

compilerServer: server
	gcc $(CFLAGS) $(LDFLAGS) server.o compress.o list.o peer.o unix.o host.o packet.o protocol.o callbacks.o win32.o -o compilerServer

server: server.c compress.c list.c peer.c unix.c host.c packet.c protocol.c callbacks.c win32.c
	gcc $(CFLAGS) $(HEADERS) -c server.c compress.c list.c peer.c unix.c host.c packet.c protocol.c callbacks.c win32.c

clean:
	rm -f *.o compilerServer

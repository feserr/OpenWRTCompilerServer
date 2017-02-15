HEADERS=-I../include/

all: compilerClient
	mkdir -p build
	cp compilerClient build/
	make clean

compilerClient: client
	gcc $(CFLAGS) $(LDFLAGS) client.o compress.o list.o peer.o unix.o host.o packet.o protocol.o callbacks.o win32.o -o compilerClient

client: client.c compress.c list.c peer.c unix.c host.c packet.c protocol.c callbacks.c win32.c
	gcc $(CFLAGS) $(HEADERS) -c client.c compress.c list.c peer.c unix.c host.c packet.c protocol.c callbacks.c win32.c

clean:
	rm -f *.o compilerClient

clean-all: clean
	rm -r build

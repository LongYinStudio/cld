PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man/man1
ARTPREFIX = $(PREFIX)/share/cld
BINPREFIX = $(PREFIX)/bin/cld
CFLAGS = -Wall

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

cld: cld.o
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm cld cld.o

install:
	cp -f ./cld $(BINPREFIX)
	chmod 755 $(BINPREFIX)
	mkdir -p $(MANPREFIX) $(ARTPREFIX)
	cp -f ./cld.1 $(MANPREFIX)/cld.1
	chmod 644 $(MANPREFIX)/cld.1
	sed "s|ARTPATH|$(ARTPREFIX)|g" < ./cld.1 > $(MANPREFIX)/cld.1
	cp -r ./art/* $(ARTPREFIX)/
	chmod 644 $(ARTPREFIX)/*

uninstall:
	rm -f $(BINPREFIX)
	rm -f $(MANPREFIX)/cld.1
	rm -rf $(ARTPREFIX)

# Makefile for axfinddev
CC = gcc
CFLAGS = -Wall -O2
LDFLAGS = -lax25
SRC = src/axfinddev.c
BIN = axfinddev
MANPAGE = src/axfinddev.8

PREFIX = /usr

all: $(BIN)

$(BIN): $(SRC)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

install:
	# Install binary
	install -D -m 0755 $(BIN) $(DESTDIR)$(PREFIX)/bin/$(BIN)
	# Install manpage (uncompressed)
	install -D -m 0644 $(MANPAGE) $(DESTDIR)$(PREFIX)/share/man/man8/$(notdir $(MANPAGE))

clean:
	rm -f $(BIN)

.PHONY: all install clean


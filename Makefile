CC=gcc
CFLAGS=-O2 -g -Wall
OPTFLAGS=-O3 -g -Wall
OBJS_COMMON= kernel.o rdtsc.o

all:	base	measure


base:  $(OBJS_COMMON) driver_base.o
	$(CC) -o $@ $^

measure: $(OBJS_COMMON) driver.o
	$(CC) -o $@ $^


driver_base.o: driver_base.c
	$(CC) $(CFLAGS) -c $<

driver.o: driver.c
	$(CC) $(CFLAGS) -c $<


clean:
	rm -rf $(OBJS_COMMON) driver.o driver_base.o measure base

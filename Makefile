CC=gcc
CFLAGS=-O2 -g -Wall
OPTFLAGS=-O3 -g -Wall
OBJS_COMMON= kernel.o rdtsc.o

all:	base	measure	etalonnage


base:  $(OBJS_COMMON) driver_base.o
	$(CC) -o $@ $^

measure: $(OBJS_COMMON) driver.o
	$(CC) -o $@ $^

etalonnage: $(OBJS_COMMON) driver_etalonnage.o
	$(CC) -o $@ $^

driver_base.o: driver_base.c
	$(CC) $(CFLAGS) -c $<

driver.o: driver.c
	$(CC) $(CFLAGS) -c $<

driver_etalonnage.o: driver_etalonnage.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -rf $(OBJS_COMMON) driver.o driver_base.o measure base

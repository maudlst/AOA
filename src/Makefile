CC=gcc
FLAGS=-Wall -g
NO_OPTFLAGS=-O1
CFLAGS=-O2
OPTFLAGS=-O3
FULLOPTFLAGS=-O3 -march=native

BIN_FOLDER=bin/
OBJS_COMMON=kernel.o rdtsc.o

all:clean	base	measure	etalonnage

kernel.o: kernel.c
	$(CC) $(CFLAGS) -o $@ -c $^

base:  $(OBJS_COMMON) driver_base.o
	$(CC) $(FLAGS) $(NO_OPTFLAGS) -o $@ $^

measure: $(OBJS_COMMON) driver.o
	$(CC) $(FLAGS) $(NO_OPTFLAGS) -o $@ $^

etalonnage: $(OBJS_COMMON) driver_etalonnage.o
	$(CC) $(FLAGS) $(NO_OPTFLAGS) -o $@ $^

clean:
	rm -rf $(OBJS_COMMON) driver.o driver_base.o bin/measure base

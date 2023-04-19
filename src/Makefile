ifeq ($(origin CC), undefined)
CC = gcc
endif
ifeq ($(origin CC), default)
CC = gcc
endif
FLAGS = -Wall -g
NO_OPTFLAGS = -O2
OPTFLAGS ?= -O2
KERNEL ?= kernel.c

BIN_FOLDER=bin/
OBJS_COMMON=kernel.o rdtsc.o

all:clean	base	measure	etalonnage

kernel.o: kernels/$(KERNEL)
	$(CC)   $(FLAGS) $(OPTFLAGS) -o $@ -c $^ 

rdtsc.o: rdtsc.c
	$(CC) $(FLAGS) $(NO_OPTFLAGS) -o $@ -c $^

driver_base.o: driver_base.c
	$(CC) $(FLAGS) $(NO_OPTFLAGS) -o $@ -c $^

driver.o: driver.c
	$(CC) $(FLAGS) $(NO_OPTFLAGS) -o $@ -c $^

base:  $(OBJS_COMMON) driver_base.o
	$(CC) $(FLAGS) $(NO_OPTFLAGS) -o $@ $^

measure: $(OBJS_COMMON) driver.o
	$(CC) $(FLAGS) $(NO_OPTFLAGS) -o $@ $^

etalonnage: $(OBJS_COMMON) driver_etalonnage.o
	$(CC) $(FLAGS) $(NO_OPTFLAGS) -o $@ $^

clean:
	rm -rf $(OBJS_COMMON) driver.o driver_base.o bin/measure base

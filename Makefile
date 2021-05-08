PROGRAM_PREFIX=code

# Source files
SRCS=$(PROGRAM_PREFIX)d.cpp
SRCP=$(PROGRAM_PREFIX)dp.cpp

CC=g++
CFLAGS=-O3 -std=c++17 -fpermissive
OPENMP_FLAGS=-fopenmp
MPI_FLAGS=-DMPI

# Make rules
$(PROGRAM_PREFIX)s: $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -o $(PROGRAM_PREFIX)s

$(PROGRAM_PREFIX)p: $(SRCP)
	$(CC) $(CFLAGS) $(OPENMP_FLAGS) $(SRCP) -o $(PROGRAM_PREFIX)p


serial:
	make $(PROGRAM_PREFIX)s

parallel:
	make $(PROGRAM_PREFIX)p

mpi:
	make $(PROGRAM_PREFIX)m

clean:
	rm -f code?

all:
	make clean
	make serial
	make parallel


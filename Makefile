FC=gfortran
CC=gcc
FFLAGS=-O3 -Wall -Wextra -std=f2008
SRC = resdiv.f90
OBJ = $(SRC:.f90=.o)

OBJ_LINK = $(OBJ) getch.o

all: resdiv

resdiv: $(OBJ_LINK)
	$(FC) $(FFLAGS) -o $@ $^

%.o: %.f90
	$(FC) $(FFLAGS) -c -o $@ $<

clean:
	rm *.o
	rm resdiv

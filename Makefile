OPT = -ffree-form -std=f2008 -fimplicit-none -Wall -pedantic -cpp

main:
	gfortran $(OPT) -c mult.F90
	gfortran $(OPT) -c main.F90
	gfortran $(OPT) main.o mult.o -o main

clean:
	rm *.o *.mod main

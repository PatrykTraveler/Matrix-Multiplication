OPT = -ffree-form -std=f2008 -fimplicit-none -Wall -pedantic -cpp

PFUNIT = /home/traveler/pFUnit
F90_VENDOR = GNU
F90 = gfortran
SHELL := /bin/bash


include $(PFUNIT)/include/base.mk

FFLAGS +=  -frecursive -ffree-form -std=f2008 -fimplicit-none -Wall -pedantic 
LIBS = $(PFUNIT)/lib/libpfunit.a

PFS = $(wildcard *.pf)
OBJS = $(PFS:.pf=.o)

%.f90: %.pf
	$(PFUNIT)/bin/pFUnitParser.py $< $@

%.o: %.f90
	$(F90) $(FFLAGS) -I$(PFUNIT)/mod -c $<

test: testSuites.inc multTest.o $(OBJS)
	$(F90) -fPIC  -o $@ -I. -I$(PFUNIT)/mod -I$(PFUNIT)/include \
		$(PFUNIT)/include/driver.F90 \
		./*$(OBJ_EXT) $(LIBS) $(FFLAGS)

build:
	gfortran $(OPT) -c utilities.F90
	gfortran $(OPT) -c mult.F90
	gfortran $(OPT) -c main.F90
	gfortran $(OPT) main.o mult.o utilities.o -o main

clean:
	rm *.o *.mod main

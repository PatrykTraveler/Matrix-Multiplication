OPT = -ffree-form -std=f2008 -fimplicit-none -Wall -pedantic -cpp -funroll-loops

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
	gfortran $(OPT) -c utilities.F90 mult.F90 main.F90
	gfortran $(OPT) main.o mult.o utilities.o -o main

build-opt:
	gfortran $(OPT) -c -O2 utilities.F90 mult.F90 main.F90
	gfortran $(OPT) -O2 main.o mult.o utilities.o -o main

check-time:
	for size in 200 400 600 800 1000 1200 1400 1600 1800 2000 ; do \
		./main $$size $$size $$size $$size 0 ./Results/normal.txt ; \
	done ; \
	for size in 200 400 600 800 1000 1200 1400 1600 1800 2000 ; do \
		./main $$size $$size $$size $$size 1 ./Results/dot.txt ; \
	done ; \
	for size in 200 400 600 800 1000 1200 1400 1600 1800 2000 ; do \
		./main $$size $$size $$size $$size 2 ./Results/matmul.txt ; \
	done ; \
	for size in 200 400 600 800 1000 1200 1400 1600 1800 2000 ; do \
		./main $$size $$size $$size $$size 3 ./Results/cache.txt ; \
	done ; \
	for size in 200 400 600 800 1000 1200 1400 1600 1800 2000 ; do \
		./main $$size $$size $$size $$size 4 ./Results/dotcache.txt ; \
	done ; \

clean:
	rm *.o *.mod main results.txt

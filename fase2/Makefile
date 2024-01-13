CC = gcc
SRC = src/
CFLAGS = -O3 -funroll-loops -finline-functions -ftree-vectorize -msse4 -fno-omit-frame-pointer # none
.DEFAULT_GOAL = all
NTHREADS = 40

all: MDseq.exe MDpar.exe

MDseq.exe: $(SRC)/MDseq.cpp
	$(CC) $(CFLAGS) $(SRC)MDseq.cpp -lm -o MDseq.exe

MDpar.exe: $(SRC)/MDpar.cpp
	$(CC) $(CFLAGS) $(SRC)MDpar.cpp -lm -fopenmp -o MDpar.exe

clean:
	-rm ./MD*.exe
	-rm cp_average.txt
	-rm cp_output.txt
	-rm cp_traj.xyz
	-rm gmon.out
	-rm slurm-*.out

runseq:
	./MDseq.exe < inputdata.txt

runpar:
	export OMP_NUM_THREADS=$(NTHREADS); ./MDpar.exe < inputdata.txt


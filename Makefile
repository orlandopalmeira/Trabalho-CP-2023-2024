CC = gcc
SRC = src/
CFLAGS = -O3 -funroll-loops -finline-functions -ftree-vectorize -msse4 -fno-omit-frame-pointer # none
.DEFAULT_GOAL = all
NTHREADS = 40

all: MDseq.exe MDpar.exe

gprof: $(SRC)/MDseq.cpp
	$(CC) $(CFLAGS) -pg -g $(SRC)MDpar.cpp -lm -o MDseq.exe

MDseq.exe: $(SRC)/MDseq.cpp
	module load gcc/11.2.0;
	$(CC) $(CFLAGS) $(SRC)MDseq.cpp -lm -o MDseq.exe

MDpar.exe: $(SRC)/MDpar.cpp
	module load gcc/11.2.0;
	$(CC) $(CFLAGS) $(SRC)MDpar.cpp -lm -fopenmp -o MDpar.exe

clean:
	-rm ./MD*.exe
	-rm cp_average.txt
	-rm cp_output.txt
	-rm cp_traj.xyz
	-rm gmon.out
	-rm slurm-*.out

runs:
	sbatch runS.sh

runp:
	export OMP_NUM_THREADS=$(NTHREADS); sbatch runP.sh

runseq:
	./MDseq.exe < inputdata.txt

runpar:
	./MDpar.exe < inputdata.tx


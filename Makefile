CC = gcc
SRC = src/
CFLAGS = -O3 -funroll-loops -finline-functions -ftree-vectorize -msse4 -fopt-info-vec -fno-omit-frame-pointer -pg # none
.DEFAULT_GOAL = all

all: MDseq.exe MDpar.exe

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
	-rm cp_traj.
	-rm gmon.out
	-rm slurm-*.out

runs:
	sbatch runS.sh

runp:
	sbatch runP.sh

runseq:
	./MDseq.exe < inputdata.txt

runpar:
	./MDpar.exe < inputdata.tx


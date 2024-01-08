CC = gcc
SRC = src/
CFLAGS = -O3 -funroll-loops -finline-functions -ftree-vectorize -msse4 -fno-omit-frame-pointer
CUDAFLAGS = -O3 -std=c++11 -arch=sm_35 -Wno-deprecated-gpu-targets
.DEFAULT_GOAL = all
NTHREADS = 40

all: MDseq.exe MDpar.exe MDcuda.exe

Makefile: MDseq.exe MDpar.exe MDcuda.exe

MDseq.exe: $(SRC)/MDseq.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) $(SRC)MDseq.cpp -lm -o MDseq.exe

MDpar.exe: $(SRC)/MDpar.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) $(SRC)MDpar.cpp -lm -fopenmp -o MDpar.exe

MDcuda.exe: $(SRC)/MDcuda.cu
	module load gcc/7.2.0;\
	module load cuda/11.3.1;\
	nvcc $(CUDAFLAGS) $(SRC)MDcuda.cu -o MDcuda.exe

clean:
	-rm ./MD*.exe
	-rm cp_average.txt
	-rm cp_output.txt
	-rm cp_traj.xyz
	-rm slurm-*.out

# Executado pelos alunos

runs:
	sbatch runS.sh

runp:
	export OMP_NUM_THREADS=$(NTHREADS); sbatch runP.sh

runcuda:
	module load gcc/7.2.0;\
	module load cuda/11.3.1;\
	sbatch ./runCuda.sh

# Executado pelos docentes

runseq:
	./MDseq.exe < inputdata.txt

runpar:
	export OMP_NUM_THREADS=$(NTHREADS); ./MDpar.exe < inputdata.tx

run:
	module load gcc/7.2.0;\
	module load cuda/11.3.1;\
	sbatch ./runCuda.sh
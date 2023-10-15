CC = gcc
SRC = src/
CFLAGS = -O3 -ftree-vectorize -msse4 -fno-omit-frame-pointer -pg # none
.DEFAULT_GOAL = MD.exe
FILE = MD.cpp

MD.exe: $(SRC)/MD.cpp
	$(CC) $(CFLAGS) $(SRC)$(FILE) -lm -o MD.exe

assembly:
	$(CC) -S $(CFLAGS) $(SRC)$(FILE) -lm -o MD.s 

clean:
	rm ./MD.exe
	rm cp_average.txt
	rm cp_output.txt
	rm cp_traj.xyz
	rm gmon.out

perf:
	srun --partition=cpar perf stat -e instructions,cycles ./MD.exe < inputdata.txt

perfCacheMisses: 
	srun --partition=cpar perf stat -e L1-dcache-load-misses -M cpi ./MD.exe < inputdata.txt


compare:
	$(CC) $(CFLAGS) $(SRC)MD_flat.cpp -lm -o MD.exe
	make perfCacheMisses
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe
	make perfCacheMisses
	make clean

run:
	./MD.exe < inputdata.txt

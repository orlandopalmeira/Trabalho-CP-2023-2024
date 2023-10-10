CC = gcc
SRC = src/
CFLAGS = -O3 -pg # none

.DEFAULT_GOAL = MD.exe

MD.exe: $(SRC)/MD.cpp
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe

clean:
	rm ./MD.exe
	rm cp_average.txt
	rm cp_output.txt
	rm cp_traj.xyz
	rm gmon.out

perf:
	srun --partition=cpar perf stat -e instructions,cycles ./MD.exe < inputdata.txt

re:
	make clean
	make 
	make perf

run:
	./MD.exe < inputdata.txt

CC = gcc
SRC = src/
CFLAGS = -O3 -funroll-loops -ftree-vectorize -msse4 # none
FILE = MD.cpp

.DEFAULT_GOAL = MD.exe

MD.exe: $(SRC)/MD.cpp
	$(CC) $(CFLAGS) $(SRC)$(FILE) -lm -o MD.exe

assembly:
	$(CC) -S $(CFLAGS) $(SRC)$(FILE) -lm -o MD.s 

clean:
	rm ./MD.exe

run:
	./MD.exe < inputdata.txt

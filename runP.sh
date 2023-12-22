#!/bin/bash
#SBATCH --time=10:00
#SBATCH --cpus-per-task=40
#SBATCH --partition=cpar
perf stat -e instructions,cycles,LLC-loads ./MDpar.exe < inputdata.txt

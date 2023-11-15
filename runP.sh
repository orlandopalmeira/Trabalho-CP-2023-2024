#!/bin/bash
#SBATCH --time=10:00
#SBATCH --cpus-per-task=4
#SBATCH --partition=cpar
perf stat -M cpi -e instructions,cycles ./MDpar.exe < inputdata.txt

#!/bin/bash
#SBATCH --time=10:00
#SBATCH --cpus-per-task=40
#SBATCH --partition=cpar
perf stat -M cpi ./MD.exe < inputdata.txt

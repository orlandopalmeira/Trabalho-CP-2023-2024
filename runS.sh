#!/bin/bash
#SBATCH --partition=cpar
perf stat -M cpi ./MDseq.exe < inputdata.txt

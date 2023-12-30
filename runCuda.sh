#!/bin/bash
#SBATCH --time=10:00
#SBATCH --partition=cpar
#SBATCH --constraint=k20
#SBATCH --ntasks=1

time nvprof ./MDcuda.exe < inputdata.txt
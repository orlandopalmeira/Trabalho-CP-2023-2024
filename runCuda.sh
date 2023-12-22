#!/bin/bash
#SBATCH --time=10:00
#SBATCH --partition=cpar
#SBATCH --constraint=k20

nvprof ./MDcuda.exe < inputdata.txt
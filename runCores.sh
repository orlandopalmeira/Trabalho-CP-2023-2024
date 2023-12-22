#!/bin/bash

THREADS_LIST="4 8 12 16 20 24 28 32 36 40"

make
for THREADS in $THREADS_LIST; do
    JOB_NAME="${THREADS}_threads"
    echo "A correr $JOB_NAME"
    export OMP_NUM_THREADS=$THREADS
    sbatch --output=results/$JOB_NAME.out --partition=cpar --cpus-per-task=40 runP.sh
done
#!/bin/bash

CORES_LIST="4 8 12 16 20 24 28 32 36 40"

START_TIME="2023-11-16T20:03:00"

for CORES in $CORES_LIST; do
    JOB_NAME="${CORES}_cores"
    echo "A correr $JOB_NAME"
    # sbatch --output=core_outputs/$JOB_NAME.out --partition=cpar --cpus-per-task=$CORES perf.sh
    sbatch --output=results/$JOB_NAME.out --partition=cpar --cpus-per-task=$CORES --begin=$START_TIME runP2.sh
done
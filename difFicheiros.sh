#!/bin/bash

if diff cp_average.txt cp_averageOriginal.txt > /dev/null; then
    echo "cp_average ok"
else
    echo "cp_average not ok"
fi

if diff cp_output.txt cp_outputOriginal.txt > /dev/null; then
    echo "cp_output ok"
else
    echo "cp_output not ok"
fi

if diff cp_traj.xyz cp_trajOriginal.xyz > /dev/null; then
    echo "cp_traj ok"
else
    echo "cp_traj not ok"
fi
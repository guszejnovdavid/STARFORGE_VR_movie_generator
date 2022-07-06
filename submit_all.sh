#!/bin/sh

for num in {0..15}
do
    cd $num
    sbatch run_vis.sh
    cd ..
done


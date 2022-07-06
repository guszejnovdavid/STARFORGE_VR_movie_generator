#!/bin/sh
#SBATCH -J blender_run_4
#SBATCH -o myjob.%j.out   # define stdout filename; %j expands to jobid
#SBATCH -e myjob.%j.err   # define stderr filename; skip to combine stdout and stderr
#SBATCH --mail-user=EMAIL
#SBATCH --mail-type=ALL
#SBATCH -p small   #normal  development small
#SBATCH -t 48:00:00
#SBATCH -N 1 -n 56
#SBATCH -A AST21002

mkdir -p blender_output
blender -b CubeMap_12000_16000.blend -o blender_output/frame_ -a

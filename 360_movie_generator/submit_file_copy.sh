#!/bin/sh
#SBATCH -J blender_file_copy
#SBATCH -o myjob.%j.out   # define stdout filename; %j expands to jobid
#SBATCH -e myjob.%j.err   # define stderr filename; skip to combine stdout and stderr
#SBATCH --mail-user=EMAIL
#SBATCH --mail-type=ALL
#SBATCH -p small   #normal  development small
#SBATCH -t 6:00:00
#SBATCH -N 1 -n 56
#SBATCH -A AST21002

./rename_files_for_blender.sh

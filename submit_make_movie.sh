#!/bin/sh
#SBATCH -J ffmpeg_movie
#SBATCH -o myjob.%j.out   # define stdout filename; %j expands to jobid
#SBATCH -e myjob.%j.err   # define stderr filename; skip to combine stdout and stderr
#SBATCH --mail-user=EMAIL
#SBATCH --mail-type=ALL
#SBATCH -p skx-normal
#SBATCH -t 12:00:00
#SBATCH -N 1 -n 48
#SBATCH -A TG-AST190018


python make_movie.py --map_type=MAP_TYPE CUBEMAPFLAG

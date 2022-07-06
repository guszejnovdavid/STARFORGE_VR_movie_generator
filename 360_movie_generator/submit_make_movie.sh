#!/bin/sh
#SBATCH -J 360_ffmpeg_movie
#SBATCH -o myjob.%j.out   # define stdout filename; %j expands to jobid
#SBATCH -e myjob.%j.err   # define stderr filename; skip to combine stdout and stderr
#SBATCH --mail-user=EMAIL
#SBATCH --mail-type=ALL
#SBATCH -p small   #normal  development small
#SBATCH -t 48:00:00
#SBATCH -N 1 -n 56
#SBATCH -A AST21002





python make_movie.py
python2 inject_metadata.py
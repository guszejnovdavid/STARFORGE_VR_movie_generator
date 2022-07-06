#!/bin/sh
#SBATCH -J Crunchsnap_movie_FOLDERNUM
#SBATCH -o myjob.%j.out   # define stdout filename; %j expands to jobid
#SBATCH -e myjob.%j.err   # define stderr filename; skip to combine stdout and stderr
#SBATCH --mail-user=EMAIL
#SBATCH --mail-type=ALL
#SBATCH -p skx-normal
#SBATCH -t 48:00:00
#SBATCH -N 1 -n 48
#SBATCH -A TG-AST190018



source $HOME/.bashrc
snapfolder=SNAPFOLDER #path/snapshotfolder/output
camera_script=MOVIESCRIPTFILE #make_movie_from_camerafile.py
res=RESOLUTION # 3840, 1920
num=FOLDERNUM #0, 1, 2 ...

python $camera_script camerafile_$num.txt $snapfolder --np=12 --np_render=4 --res=$res --no_timestamp --fresco_stars --no_size_scale --map_type=MAP_TYPE --SHO_RGB_norm=0 CUBEMAPFLAG

#!/bin/sh

EMAIL='guszejnov@utexas.edu' #email where slurm messages are sent
MAP_TYPE='SigmaGas' #CoolMap SigmaGas SHOMap
SNAPFOLDER=/scratch/05917/tg852163/GMC_sim/Runs/Physics_ladder/M2e4_C_M_J_RT_W_alpha1_v1.1_2e7/output #where the snapshots are
MOVIESCRIPTFILE='~/scripts/CrunchSnaps/scripts/make_movie_from_camerafile.py' #path to Crunchsnaps movie script
RESOLUTION=1920 #resolution of inal image
CUBEMAPFLAG='' #Set it to '--cubemap' to make images in the 6 cubemap direction (needed for 360/VR movies), otherwise set it to an empty string like ''

for num in {0..15}
do
    mkdir -p $num
    cp run_vis.sh $num/
    cd $num
    sed -i 's/RESOLUTION/'$RESOLUTION'/' run_vis.sh
    sed -i 's/FOLDERNUM/'$num'/' run_vis.sh
    sed -i 's+SNAPFOLDER+'$SNAPFOLDER'+' run_vis.sh #using different separator because of paths
    sed -i 's+MOVIESCRIPTFILE+'$MOVIESCRIPTFILE'+' run_vis.sh 
    sed -i 's/EMAIL/'$EMAIL'/' run_vis.sh
    sed -i 's/MAP_TYPE/'$MAP_TYPE'/' run_vis.sh
    sed -i 's/CUBEMAPFLAG/'$CUBEMAPFLAG'/' run_vis.sh
    cd ..
done

sed -i 's/MAP_TYPE/'$MAP_TYPE'/' submit_make_movie.sh
sed -i 's/CUBEMAPFLAG/'$CUBEMAPFLAG'/' submit_make_movie.sh
sed -i 's/EMAIL/'$EMAIL'/' submit_make_movie.sh

sed -i 's/EMAIL/'$EMAIL'/' '360_movie_generator/submit_make_movie.sh'
sed -i 's/EMAIL/'$EMAIL'/' '360_movie_generator/submit_file_copy.sh'

python stellarscape_movie.py #generate camera positions

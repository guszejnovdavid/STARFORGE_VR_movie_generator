#!/bin/sh
trap "exit" INT #exit on SIGINT (Ctrl-C)


mkdir -p up
mkdir -p down
mkdir -p Right
mkdir -p Left
mkdir -p Forward
mkdir -p Backward

frames_done_prev=0
for foldernum in {0..15..1} ; do
	echo -e "Starting "$foldernum
	frames_done=0
	for filename in ../$foldernum/*.png ; do
		file_number=$(echo $filename | sed 's/.*Density_\([0-9].*\)_[0-9].*/\1/')
		if [[ $file_number == 00000 ]]; then
			file_number=0
		else
			file_number=$(echo $file_number | sed -r 's/0*([0-9]*)/\1/')
		fi
		frame_number=$(($frames_done_prev + $file_number))
		#frame_number=1$(printf "%04d" $frame_number)
		frame_number=$(($frame_number + 10000))
		direction=$(echo $filename | sed 's/.*[0-9]_\(.*\).png/\1/')
		if [[ $direction == up ]]; then
			frames_done=$(($frames_done + 1))
		fi
		case $direction in
		  right)
			target_folder=Right
			;;
		  left)
			direction=Left
			target_folder=Left
			;;
		  forward)
			direction=Forward
			target_folder=Forward
			;;
		  backward)
			direction=Backward
			target_folder=Backward
			;;
		  up)
			target_folder=up
			;;
		  down)
			direction=Down
			target_folder=down
			;;
		  *)
			;;
		esac
		cp $filename $target_folder/SurfaceDensity_"$direction"_"$frame_number".png
		#echo -e $filename copied to $direction/SurfaceDensity_"$direction"_"$frame_number".png
	done
	frames_done_prev=$(($frames_done + $frames_done_prev))
done

echo -e "Done!"


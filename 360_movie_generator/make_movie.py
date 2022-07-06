from glob import glob
from natsort import natsorted
import os


moviefilename='movie'
fps=60
filenames = glob('blender_output/frame_*.png')
filenames=natsorted(filenames)
framefile="frames.txt"
#Use ffmpeg to create movie
f=open(framefile,'w'); f.write('\n'.join(["file '%s'"%f for f in filenames])); f.close()
os.system("ffmpeg -y -r " + str(fps) + " -f concat -i "+framefile+" -vb 200M -pix_fmt yuv420p  -q:v 0 -vcodec h264 -acodec aac -strict -2 -preset slow " + moviefilename + "_360.mp4")
os.remove(framefile)

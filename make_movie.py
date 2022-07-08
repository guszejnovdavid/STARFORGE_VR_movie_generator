#!/usr/bin/env python
"""
Usage:
make_movie.py [options]

Options:
    -h --help                 Show this screen.
    --map_type=<type>         Set the type of map to do, available options are SigmaGas,CoolMap and SHOMap [default: CoolMap]
    --cubemap                 Render 6 faces of a cubemap surrounding the camera
    --fps=<f>                 Frames per second for the movie [default: 60]
    --moviefilename=<name>    Movie filename [default: movie]
"""

from docopt import docopt
from glob import glob
from natsort import natsorted
import os

options = docopt(__doc__)
cubemap = options["--cubemap"]
fps = int(options["--fps"])
moviefilename = options["--moviefilename"]
map_type = options["--map_type"]

directions=['forward']
if cubemap:
    directions += ['right', 'left', 'up', 'down', 'backward']
if map_type=='CoolMap':
    plot_type="CoolMap"
elif map_type=='SHOMap':
    plot_type="NarrowbandComposite"
elif map_type=='SigmaGas':
    plot_type="SurfaceDensity"
else:
    print("Unrecognized map type %s, exiting..."%(map_type)); exit()

for direction in directions:
    filenames=[]
    for i in range(15):
        filenames += glob('%d'%(i)+'/'+plot_type+'_?????_*_'+direction+'.png')
    filenames=natsorted(filenames)
    framefile="frames.txt"
    #Use ffmpeg to create movie
    f=open(framefile,'w'); f.write('\n'.join(["file '%s'"%f for f in filenames])); f.close()
    os.system("ffmpeg -y -r " + str(fps) + " -f concat -i "+framefile+" -vb 100M -pix_fmt yuv420p  -q:v 0 -vcodec h264 -acodec aac -strict -2 -preset slow " + moviefilename + "_" + direction + ".mp4")
    os.remove(framefile)

#! /usr/bin/env python
## Using the spatial-media injector by Google to add metadata tags for an equirectangular 360 degree mp4 file
import os
import sys

if sys.version_info[0] != 2:
    print("This script requires Python 2 to run")
    sys.exit(1)
try:
    from spatialmedia import metadata_utils
except:
    print("Could not import spatialmedia!\nYou can install spatialmedia by dowloading its source:\n \t git clone https://github.com/google/spatial-media.git\nthen installing for Python2 like:\n \t python2 setup.py install")

moviefilename="movie_360"

def console(contents):
  print(contents)

metadata = metadata_utils.Metadata()
metadata.video = metadata_utils.generate_spherical_xml("none",None)
metadata_utils.inject_metadata(moviefilename+".mp4",moviefilename+"_injected.mp4",metadata,console )




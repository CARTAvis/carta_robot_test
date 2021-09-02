#!/usr/bin/env python
from PIL import Image
import sys
import numpy as np

image1 = sys.argv[1]
image2 = sys.argv[2]

im1 = Image.open(image1) # Can be many different formats.
pix1 = im1.load()
imsize1 = im1.size


im2 = Image.open(image2) # Can be many different formats.
pix2 = im2.load()
imsize2 = im2.size

if imsize1 == imsize2:
    match = False
    for ix in range(imsize1[0]):
        for iy in range(imsize1[1]):
            rgba1 = pix1[ix, iy]
            rgba2 = pix2[ix, iy]
            if rgba1 == rgba2:
                match = True   
            else:
                #print(f"found value mismatch at ({ix}, {iy})")
                match = False
                break
        if match == False:
            break

    if match == True:
        print("identical")
    else:
        print(f"different: found value mismatch at ({ix}, {iy})")        
else:
    #print(f"found imsize mismatch: {imsize1} vs {imsize2}")
    print(f"different: found imsize mismatch: {imsize1} vs {imsize2}")
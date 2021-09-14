#!/usr/bin/env python
from PIL import Image
import sys
import numpy as np

threshold = 99.0


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
    count = 0
    for ix in range(imsize1[0]):
        for iy in range(imsize1[1]):
            rgba1 = pix1[ix, iy]
            rgba2 = pix2[ix, iy]
            if rgba1 == rgba2:
                count = count + 1   
    
    imsize = imsize1[0]*imsize1[1]
    match_rate = count/imsize*100.0        
    if match_rate < threshold:
        match = False
    else:
        match = True

    if match == True:
        print(f"identical: match rate {match_rate}% > threshold {threshold}%. {imsize-count}/{imsize} not matched.")
    else:
        print(f"different: match rate {match_rate}% < threshold {threshold}%. {imsize-count}/{imsize} not matched.")        
else:
    #print(f"found imsize mismatch: {imsize1} vs {imsize2}")
    print(f"different: found imsize mismatch: {imsize1} vs {imsize2}")
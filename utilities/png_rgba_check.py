#!/usr/bin/env python
from PIL import Image
import sys
import numpy as np
import matplotlib.pyplot as plt

debug = False

image = sys.argv[1]
xyrgba = sys.argv[2]

tmp = xyrgba.split(',')
ref_x = int(tmp[0])
ref_y = int(tmp[1])
ref_r = int(tmp[2])
ref_g = int(tmp[3])
ref_b = int(tmp[4])
ref_a = int(tmp[5])


im = Image.open(image) # Can be many different formats.
pix = im.load()

#print(im.size)
#print(pix[0,0])


if pix[ref_x, ref_y] == (ref_r, ref_g, ref_b, ref_a) or pix[ref_x, ref_y] == (ref_r, ref_g, ref_b):
    print("identical")
else:
    print("different,", (ref_x, ref_y), "should be", pix[ref_x, ref_y])


if debug:
    plt.subplot(221)
    plt.title("R channel")
    plt.imshow(im.getchannel('R'), cmap='gray', interpolation=None)
    plt.subplot(222)
    plt.title("G channel")
    plt.imshow(im.getchannel('G'), cmap='gray', interpolation=None)
    plt.subplot(223)
    plt.title("B channel")
    plt.imshow(im.getchannel('B'), cmap='gray', interpolation=None)
    #plt.subplot(224)
    #plt.title("A channel")
    #plt.imshow(im.getchannel('A'), cmap='gray', interpolation=None)
    plt.show()
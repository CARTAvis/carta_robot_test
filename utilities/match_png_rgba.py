#!/usr/bin/env python
from PIL import Image
import sys
import numpy as np
import matplotlib.pyplot as plt

debug = False

image = sys.argv[1]
xy = sys.argv[2]

tmp = xy.split(',')
ref_x1 = int(tmp[0])
ref_y1 = int(tmp[1])
ref_x2 = int(tmp[2])
ref_y2 = int(tmp[3])



im = Image.open(image) # Can be many different formats.
pix = im.load()

#print(im.size)
#print(pix[0,0])



if pix[ref_x1, ref_y1] == pix[ref_x2, ref_y2]:
    print("identical")
elif np.sum(np.abs((np.array(pix[ref_x1, ref_y1]) - np.array(pix[ref_x2, ref_y2])))) <= 3:
    # this is to conpensate the error from anti-aliasing
    print("identical, almost")
else:
    print("different,", (ref_x1, ref_y1), "should be", pix[ref_x1, ref_y1],",", (ref_x2, ref_y2), "should be", pix[ref_x2, ref_y2])


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
    plt.subplot(224)
    plt.title("A channel")
    plt.imshow(im.getchannel('A'), cmap='gray', interpolation=None)
    plt.show()

Image Processing
===============

Objective
----------
Blurring, sharpening images as well as edge detection.

Algorithm
-----
Blurring implemented using pixel averaging as each pixel is replaced by the averaged of the pixels surrounding it with different kernel sizes (3x3 then 5x5). 

Sharpening method used is unsharp masking whic blurrs image further using gaussian kernel and filter of a specific size(2x2)then proper scaling using a scaling parameter c results in a sharpened image.

Results & Observations
-----
After running the MATLAB code, it appeares the image result is indeed more blurry as expected. Then sharpening worked as expected after testing with different values of the scaling parameter c it seems that c=0.64 is the value that gives the sharpest image.

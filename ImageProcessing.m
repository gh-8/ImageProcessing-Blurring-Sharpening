%%----------DataInput------------------------------
X = imread('MonkeyImage.tiff');
X = double(X);
Y_1 = padarray(X, [1,1], 'symmetric');
[r,c,p] = size(Y_1);
X1= zeros(r-1,c-1,p);
MAT_1= zeros(3,3);
for k = 1:p
    for ii = 2:r-1
        for jj = 2:c-1
            MAT_1(ii,jj,k)=mean(mean(Y_1(ii-1:ii+1, jj-1:jj+1, k)));
        end
    end
end
X = uint8(X);
X1 = uint8(MAT_1);
figure, imshow(X)
figure, imshow(X1)
%Yes, there is a difference
%The new image X1 seems to be more
%blurred than than the original image.
X = double(X);
%% ------------------------ Padarray ------------------------------
Y_2 = padarray(X, [2,2], 'symmetric');
[r,c,p] = size(Y_2);
X2= zeros(r-2,c-2, p);
MAT_2=zeros(5,5);
for k = 1:p
    for ii = 3:r-2
        for jj = 3:c-2
            MAT_2(ii,jj,k)=mean(mean(Y_2(ii-2:ii+2, jj-2:jj+2, k)));
        end
    end
end
X2 = uint8(MAT_2);
figure, imshow(X2)
%Other changes that have to be made are the size of 
%of the matrice X2, and in the for loop too we
%start from 3 insted of 2 and we finish two elements 
%before the end.
%
%There is a difference
%The new image X2 is a more blurred than X1
%and it is even more blurred than  the original image.
%% ------------------------ Task 3 ----------------------------
H = fspecial('average',[3 3]);
X3_1 = imfilter(X, H, 'symmetric', 'same');
X3_1 = uint8(X3_1);
figure, imshow(X3_1)
%The image is the exact same as the first
%--------------------------------------------------------------
H2= fspecial('average', [5 5]);
X3_2 = imfilter(X, H2, 'symmetric', 'same');
X3_2= uint8(X3_2);
figure, imshow(X3_2)
%---------------------------------------------------------------
H3= fspecial('gaussian',[5 5], 2);
X3_3= imfilter(X, H3, 'symmetric', 'same');
X3_3= uint8(X3_3);
figure, imshow(X3_3)
%this image is more blurry than in part 2
%% ------------------------- Task 4 -----------------------------
X2 = double(X2);
XB=X2;
H4=fspecial('gaussian',[5 5], 2);
XG= imfilter(X2, H4 , 'symmetric', 'same');
c=0.64;
X_4=((c/((2*c)-1))*XB)-(((1-c)/((2*c)-1))*XG)
X_4= uint8(X_4);
figure, imshow(X_4)
%After testing with different values of c it
%seems that c=0.64 is the value that gives the sharpest image

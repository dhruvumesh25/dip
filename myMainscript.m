clear;
clc;
%% Mainscipt
% tic
% img=imread('images/peppers.png');
% img=255*im2double(img);
% [m, n, k] = size(img);
% imshow((mat2gray(img)));

% % Adding noise to the image
% variance = 0.05*(max(img(:)) - min(img(:)));
% G = (variance)*(randn(m, n, k));
% size(img)
% noisyim = img + G;
% imwrite(mat2gray(noisyim),'output/peppers_noisy.png')
% imshow((mat2gray(noisyim)));
% figure()
% new_img=myRegularize(img,noisyim,5,0.5,1,11,3.5);
% imwrite(mat2gray(new_img),'output/peppers_regularized.png')
% imshow((mat2gray(new_img)));

% toc

%% magnification
% tic
% 
% img = imread('images/lena64.png');
% img=255*im2double(img);
% 
% mag_img = imresize(img,4,'nearest');
% mag_img=255*im2double(mag_img);
% imshow(mat2gray(mag_img));
% 
% figure()
% new_img=myRegularize(mag_img,mag_img,7,20,0,100,20);
% 
% toc

%% Improvement of Lossy Compressed Images
% tic
% img = imread('images/lenna_compressed.jpg');
% img=255*im2double(img);

% printImage(img);
% 
% figure()
% new_img=myRegularize(img,img,7,4,0,10,1.75);
% imwrite(mat2gray(new_img),'output/lenna_compressed_regularized.jpg');
% toc


%% inpainting
tic

img = imread( 'images/parrot.ppm' );
mask = imread( 'images/parrot_mask.pgm' );

img=255*im2double(img);
[m, n, k] = size(img);
imshow((mat2gray(img)));

figure()

new_img = pde_inpaint(img, mask, 5, 4.5, 500, 200);

toc

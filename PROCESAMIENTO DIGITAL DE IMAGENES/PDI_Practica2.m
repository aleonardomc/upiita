clear all 
close all

%img = imread('retrato.jpg');
img = imread('paisaje.jpg');
%img = imread('colores.jpg');
img1 = img;
img2 = img;
img3 = img;
img4 = img;
% img = imread('colores.jpg');

figure(1)
imshow(img);
planoR = img(:,:,1);
planoG = img(:,:,2);
img1(:,:,2) = img1(:,:,2) * .35;
planoGModificado = img(:,:,2);
planoB = img(:,:,3);

figure (2)
imshow(img1)

figure(3)
img2(:,:,1) = img2(:,:,1) + 100;
imshow(img2)

figure(4)
img3(:,:,3) = img2(:,:,3) * 1.5;
imshow(img3)

figure(5)
img4(:,:,1) = img4(:,:,1) * 1.87;
img4(:,:,2) = img4(:,:,1) * .85;
img4(:,:,3) = img4(:,:,1) * .25;
imshow(img4)
clear all 
close all

img = imread('andreaminini3.jpg');
%img = imread('andreaminini2.jpg');
%img = imread('imagenIlusionOptica2.jpg');
%img = imread('patronUrbano.jpg');
%img = imread('retrato.jpg')
factor = .7;

imagenAmpliada = imresize(img, factor, 'nearest', 'Antialiasing', false);
imagenComprimida = imresize(img, factor, 'nearest', 'Antialiasing', true);
figure(1)
imshow(img)
figure(2)
imshow(imagenAmpliada)
title ('Imagen Comprimida con Nearest y sin filtro')
figure(3)
imshow(imagenComprimida)
title ('Imagen Comprimida con Nearest y con filtro')


imagenAmpliada = imresize(img, factor, 'bilinear', 'Antialiasing', false);
imagenComprimida = imresize(img, factor, 'bilinear', 'Antialiasing', true);

figure(4)
imshow(imagenAmpliada)
title ('Imagen Comprimida con Bilinear y sin filtro')
figure(5)
imshow(imagenComprimida)
title ('Imagen Comprimida con Bilinear y con filtro')


imagenAmpliada = imresize(img, factor, 'bicubic', 'Antialiasing', false);
imagenComprimida = imresize(img, factor, 'bicubic', 'Antialiasing', true);

figure(6)
imshow(imagenAmpliada)
title ('Imagen Comprimida con Bicubic y sin filtro')
figure(7)
imshow(imagenComprimida)
title ('Imagen Comprimida con Bicubic y con filtro')



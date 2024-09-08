clear all 
close all

%img = imread('paisaje1.jpg');
img = imread('rostro.jpg');
%img = imread('colores.jpg');
%img = imread('bajaResolucion.jpg');
%img = imread('bajaResolucion1.jpg');


imagenAmpliada = imresize(img, 1.8, 'nearest');
imagenComprimida = imresize(img, 0.5, 'nearest');
figure(1)
imshow(img)
figure(2)
imshow(imagenAmpliada)
title ('Imagen Ampliada con Nearest')
figure(3)
imshow(imagenComprimida)
title ('Imagen Comprimida con Nearest')


imagenAmpliada = imresize(img, 1.8, 'bilinear');
imagenComprimida = imresize(img, 0.6, 'bilinear');

figure(4)
imshow(imagenAmpliada)
title ('Imagen Ampliada con Bilinear')
figure(5)
imshow(imagenComprimida)
title ('Imagen Comprimida con Bilinear')


imagenAmpliada = imresize(img, 1.8, 'bicubic');
imagenComprimida = imresize(img, 0.6, 'bicubic');

figure(6)
imshow(imagenAmpliada)
title ('Imagen Ampliada con Bicubic')
figure(7)
imshow(imagenComprimida)
title ('Imagen Comprimida con Bicubic')


imagenAmpliada = imresize(img, 1.8, 'lanczos3');
imagenComprimida = imresize(img, 0.6, 'lanczos3');

% 5 x 5
figure(8)
imshow(imagenAmpliada)
title ('Imagen Ampliada con Lanczos')
figure(9)
imshow(imagenComprimida)
title ('Imagen Comprimida con Lanczos')

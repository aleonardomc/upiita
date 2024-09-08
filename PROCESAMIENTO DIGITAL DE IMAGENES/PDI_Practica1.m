clear all 
close all

%img = imread('retrato.jpg');
 img = imread('paisaje.jpg');
% img = imread('colores.jpg');

figure(1)
imshow(img);

NTSC_Original = reshape([0.299, 0.587, 0.114], [1, 1, 3]);
%NTSC = reshape([0.3333, 0.3333, 0.3333], [1, 1, 3]);
%NTSC = reshape([1, 0, 0], [1, 1, 3]);
%NTSC = reshape([0, 1, 0], [1, 1, 3]);
%NTSC = reshape([0, 0, 1], [1, 1, 3]);
%NTSC = reshape([0.25, 0.4, 0.35], [1, 1, 3]);

NTSC = reshape([0.37, 0.47, 0.26], [1, 1, 3]);

imgEscalaGrises_Original = uint8(sum(double(img) .* NTSC_Original, 3));
imgEscalaGrises_Propuesta = uint8(sum(double(img) .* NTSC, 3));

figure(2)
imshow(im2gray(img))
title ('Imagen usando im2gray')

figure(3)
imshow(imgEscalaGrises_Original);
title ('Imagen usando la formula NTSC')

figure(4)
imshow(imgEscalaGrises_Propuesta)
title ('Imagen usando formula Propuesta')
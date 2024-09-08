clear all 
close all

%%
img1 = imread('edificios1.jpg');
img2 = imread('edificios2.jpg');

figure(1)
subplot(211)
imshow(img1)
title('Imagen de Ciudad 1')
subplot(212)
imshow(img2)
title('Imagen de Ciudad 2')

img = imfuse(img1, img2);
imgAux = imfuse(img2, img1);
figure(2)
subplot(211)
imshow(img)
title('Imfuse de la imagen 1 con 2')
subplot(212)
imshow(imgAux)
title('Imfuse de la imagen 2 con 1')

img = imadd(img1, img2);
imgAux = imadd(img2, 100);
figure(3)
subplot(211)
title('Add de la imagen 1 con 2')
imshow(img)
subplot(212)
imshow(imgAux)
title('Add de la imagen 1 con 2')

img = imfuse(img1, img2, 'blend');
imgAux = imfuse(img2, img1, 'blend');
figure(4)
subplot(211)
imshow(img)
subplot(212)
imshow(imgAux)

%%

img1 = imread('espacio.jpg');
img2 = img1;
img = imfuse(img1, img2);
imgBlend = imfuse(img1, img2, 'blend');
for i = 1 : 5
    img = imfuse(img1, imrotate(img, 1));
    imgBlend = imfuse(img1, imrotate(imgBlend, 1), 'blend');
end

figure(5)
imshow(img1)
figure(6)
imshow(img)
figure(7)
imshow(imgBlend)

%%
img1 = imread('espacio2.jpg');
img2 = imread('galaxias.jpg');
suma = imadd(img1, imresize(img2, size(img1,1,2)) *.8);
resta = imsubtract(img1, imresize(img2, size(img1,1,2)));
figure(8)
imshow(suma)

figure(9)
imshow(resta)

img2 = imread('mar.jpg');
img1 = imread('cielo2.jpg');
resta = imsubtract(img1, imresize(img2, size(img1,1,2)) *.8);
figure(10)
imshow(resta)

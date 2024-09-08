clear all 
close all

%% Ecualizador
clear all
close all
%img1 = imread('fotoAntigua.jpg');
img1 = imread('fotoAntigua1.jpg');

figure
nexttile;
imshow(img1)
nexttile;
imshow(histeq(img1, 10))

figure
subplot(211)
imhist(img1)
subplot(212)
imhist(histeq(img1))

img1 = imread('fotoAntigua.jpg');

figure
nexttile;
imshow(img1)
nexttile;
imshow(histeq(img1))

figure
subplot(211)
imhist(img1)
subplot(212)
imhist(histeq(img1))


img1 = imread('galaxia2.jpg');

figure
nexttile;
imshow(img1)
nexttile;
imshow(histeq(img1, 3))

figure
subplot(211)
imhist(img1)
subplot(212)
imhist(histeq(img1, 3))


figure
nexttile;
imshow(img1)
nexttile;
imshow(histeq(img1, 64))

figure
subplot(211)
imhist(img1)
subplot(212)
imhist(histeq(img1, 64))



img1 = imread('fauna.jpg');

figure
nexttile;
imshow(img1)
nexttile;
imshow(histeq(img1))

figure
subplot(211)
imhist(img1)
subplot(212)
imhist(histeq(img1))


img1 = imread('colores.jpg');

figure
nexttile;
imshow(img1)
nexttile;
imshow(histeq(img1))

figure
subplot(211)
imhist(img1)
subplot(212)
imhist(histeq(img1))


%% Logaritmica
clear all
close all
img1 = imread('bosque.jpg');
g = .25 * log (1 + double(img1));
g1 = .1 * log (1 + double(img1));

figure
nexttile;
imshow(img1)
nexttile;
imshow(g)
nexttile;
imshow(g1)

figure
subplot(311)
imhist(img1)
subplot(312)
imhist(g)
subplot(313)
imhist(g1)

img1 = imread('desierto2.jpg');
g = .11 * log (1 + double(img1));

figure
nexttile;
imshow(img1)
nexttile;
imshow(g)

figure
subplot(211)
imhist(img1)
subplot(212)
imhist(g)


img1 = imread('espacio4.jpg');
g = .15 * log (1 + double(img1));

figure
nexttile;
imshow(img1)
nexttile;
imshow(g)

figure
subplot(211)
imhist(img1)
subplot(212)
imhist(g)


img1 = imread('pintura.jpg');
g = .17 * log (1 + double(img1));

figure
nexttile;
imshow(img1)
nexttile;
imshow(g)

figure
subplot(211)
imhist(img1)
subplot(212)
imhist(g)
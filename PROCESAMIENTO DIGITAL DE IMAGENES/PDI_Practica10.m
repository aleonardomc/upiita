clear all 
close all

%% Normalizacion
clear all
close all
img1 = imread('bosque.jpg');
valorMax = max(img1, [], 'all');

imgNormalizada = double(img1/ valorMax);
figure
subplot(211)
imshow(img1)
subplot(212)
imshow(imgNormalizada)

img2 = imread('colores.jpg');
valorMax = max(img2, [], 'all');

imgNormalizada = double(img2/ valorMax);
figure
subplot(211)
imshow(img2)
subplot(212)
imshow(imgNormalizada)


img3 = imread('desierto.jpg');
valorMax = max(img3, [], 'all');

imgNormalizada = double(img3/ valorMax);
figure
subplot(211)
imshow(img3)
subplot(212)
imshow(imgNormalizada)


%% Imadjust
clear all
close all
img1 = imread('bosque.jpg');
ajuste =  imadjust(img1, [0 .23],[]);
figure
subplot(211)
imshow (img1)
subplot(212)
imshow(ajuste)

figure
subplot(211)
histogram(img1)
subplot(212)
histogram(ajuste)


%img2 = imread('playa.jpg');
img2 = imread('mar.jpg');
ajuste = imadjust(img2, [.4 1],[.1 .9]);
ajuste2 = imadjust(img2, [.4 1],[.1 .4]);
figure
subplot(211)
imshow (img2)
subplot(212)
imshow(ajuste)

figure
subplot(211)
histogram(img2)
subplot(212)
histogram(ajuste)

figure
subplot(211)
imshow(img2)
subplot(212)
imshow(ajuste2)

figure
subplot(211)
histogram(img2)
subplot(212)
histogram(ajuste2)


%img3 = imread('cielo.jpg');
%img3 = imread('edificios.jpg');
img3 = imread('gato.jpg');
ajuste = imadjust(img3, [0 .4],[0 1]);
ajuste2 = imadjust(img3, [.4 1],[.1 .4]);
figure
subplot(211)
imshow (img3)
subplot(212)
imshow(ajuste)

figure
subplot(211)
histogram(img3)
subplot(212)
histogram(ajuste)

figure
subplot(211)
imshow(img3)
subplot(212)
imshow(ajuste2)

figure
subplot(211)
histogram(img3)
subplot(212)
histogram(ajuste2)


%% Probando valores de gamma diferentes
clear all
close all
img1 = imread('colores.jpg');
ajuste = imadjust(img1, [], [], 0.1);
ajuste2 = imadjust(img1, [], [], 1.9);
figure
subplot(311)
imshow (img1)
subplot(312)
imshow(ajuste)
subplot(313)
imshow(ajuste2)


img2 = imread('galaxias.jpg');
ajuste = imadjust(img2, [.1 .7], [], .3);
figure
subplot(211)
imshow (img2)
subplot(212)
imshow(ajuste)

figure
subplot(211)
histogram(img2)
subplot(212)
histogram(ajuste)

img3 = imread('galaxia2.jpg');
ajuste = imadjust(img3, [.1 .8], [], 1.3);
figure
subplot(211)
imshow (img3)
subplot(212)
imshow(ajuste)

figure
subplot(211)
histogram(img3)
subplot(212)
histogram(ajuste)

img4 = imread('paisaje3.jpg');
ajuste = imadjust(img4, [.1 .5], [], 1.6);
figure
subplot(211)
imshow (img4)
subplot(212)
imshow(ajuste)

figure
subplot(211)
histogram(img4)
subplot(212)
histogram(ajuste)


%% Asignación de color
clear all
close all

img1 = imread('cielo.jpg');
color = imadjust(img1, [0 .2 .45 ; .9 1 .7]);

figure
subplot(411)
imshow(img1)
subplot(412)
histogram(img1(:,:,1))
subplot(413)
histogram(img1(:,:,2))
subplot(414)
histogram(img1(:,:,3))

figure
subplot(411)
imshow(color)
subplot(412)
histogram(color(:,:,1))
subplot(413)
histogram(color(:,:,2))
subplot(414)
histogram(color(:,:,3))

img2 = imread('bosque5.jpg');
color = imadjust(img2, [.1 .2 .1 ; .35 .94 .35]);

figure
subplot(411)
imshow(img2)
subplot(412)
histogram(img2(:,:,1))
subplot(413)
histogram(img2(:,:,2))
subplot(414)
histogram(img2(:,:,3))

figure
subplot(411)
imshow(color)
subplot(412)
histogram(color(:,:,1))
subplot(413)
histogram(color(:,:,2))
subplot(414)
histogram(color(:,:,3))
clear all 
close all

%%
img1 = imread('bosque.jpg');
%img1 = imread('ciudades.jpg');
img2 = imread('bosque1.jpg');
img3 = imread('bosques2.jpg');
img4 = imread('colores2.jpg');


figure(1)
subplot(211)
imshow(img1)
subplot(212)
imhist(img1)

figure(2)
subplot(211)
imshow(img2)
subplot(212)
imhist(img2)

figure(3)
subplot(211)
imshow(img3)
subplot(212)
imhist(img3)

figure(4)
subplot(211)
imshow(img4)
subplot(212)
imhist(img4)

%%
img = imread("espacio3.jpg");
figure(5)
subplot(211)
imshow(img)
subplot(212)
imshow(imcomplement(img));

figure(6)
subplot(311)
imhist(img(:,:,1))
subplot(312)
imhist(img(:,:,2))
subplot(313)
imhist(img(:,:,3))

img = imread("bosque3.jpg");
figure(7)
subplot(211)
imshow(img)
subplot(212)
imshow(imcomplement(img));

figure(8)
subplot(211)
imhist(img)
subplot(212)
imhist(imcomplement(img));


%%
img = imread("cielo3.jpg");
img = double(img);
cuadratica = img.^2 / 255;
figure(9)
subplot(211)
imshow(uint8(img))
subplot(212)
imshow(uint8(cuadratica))

img = imread("playa3.jpg");
img = double(img);
cubica = img.^3 / 255^2;
figure(10)
subplot(211)
imshow(uint8(img))
subplot(212)
imshow(uint8(cubica))

img = imread("cielo4.jpg");
img = double(img);
raiz = sqrt(255 * img);
figure(11)
subplot(211)
imshow(uint8(img))
subplot(212)
imshow(uint8(raiz))

img = imread("monte.jpg");
img = double(img);
logaritmica = 255 * (log(1+img) / log(1+255));
figure(12)
subplot(211)
imshow(uint8(img))
subplot(212)
imshow(uint8(logaritmica))
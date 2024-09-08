clear all 
close all

img = imread('paisaje2.jpg');
img1 = imread('edificios.jpg');
img2 = imread('fauna.jpg');
img3 = imread('colores1.jpg');

imgNueva = img;
figure(1)
imshow(img)
recorte = drawpolygon(); 
mask = createMask(recorte); 
roi = img .* uint8(mask); 
mask = ~mask;

%roi(:,:,1) = roi(:,:,1) - 200;
roi(:,:,2) = roi(:,:,2) - 100;
%roi(:,:,3) = roi(:,:,3) * 1;

imgFinal =  imgNueva .* uint8(mask) + roi;

figure(2)
imshow(imgFinal)


imgNueva = img1;
figure(3)
imshow(img1)
recorte = drawpolygon(); 
mask = createMask(recorte); 
roi = img1 .* uint8(mask); 
mask = ~mask;

roi(:,:,1) = roi(:,:,1) + 85;
%roi(:,:,2) = roi(:,:,2) - 100;
%roi(:,:,3) = roi(:,:,3) + 85;

imgFinal =  imgNueva .* uint8(mask) + roi;

figure(4)
imshow(imgFinal)


imgNueva = img2;
figure(5)
imshow(img2)
recorte = drawpolygon(); 
mask = createMask(recorte); 
roi = img2 .* uint8(mask); 
mask = ~mask;

roi(:,:,1) = roi(:,:,1) * 1.5;
%roi(:,:,2) = roi(:,:,2) * 0;
%roi(:,:,3) = roi(:,:,3) * 1.5;

imgFinal =  imgNueva .* uint8(mask) + roi;

figure(6)
imshow(imgFinal)


imgNueva = img3;
figure(7)
imshow(img3)
recorte = drawpolygon(); 
mask = createMask(recorte); 
roi = img3 .* uint8(mask); 
mask = ~mask;

%roi(:,:,1) = roi(:,:,1) / 3;
roi(:,:,2) = roi(:,:,2) / 2;
%roi(:,:,3) = roi(:,:,3) * 1;

imgFinal =  imgNueva .* uint8(mask) + roi;

figure(8)
imshow(imgFinal)


img4 = imread('peces.jpg');
imgNueva = img4;
figure(9)
imshow(img4)
recorte = drawpolygon(); 
mask = createMask(recorte); 
roi = img4 .* uint8(mask); 
mask = ~mask;

roi(:,:,1) = roi(:,:,1) + 30;
roi(:,:,2) = roi(:,:,2) * 1.3;
roi(:,:,3) = roi(:,:,3) / .5;

imgFinal =  imgNueva .* uint8(mask) + roi;

figure(10)
imshow(imgFinal)

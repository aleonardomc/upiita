clear all
%close all

img = imread("rostro.jpg");
imgDestino = imread("colores.jpg");
img_gray = rgb2gray(img);

figure(11)
imshow(img)
roi = roipoly(img);
J = roifill(img_gray, roi);

figure(21)
imshow(J)

%%%
img = imread("paisaje.jpg");
imgNueva = imresize(imgDestino, [size(img,1,2)]);
figure(31)
imshow(img)
recorte = drawpolygon(); 
mask = createMask(recorte); 
roi = img .* uint8(mask); 
mask = ~mask;
img2 =  imgNueva .* uint8(mask) + roi;

figure(41)
imshow(roi)


figure(51)
imshow(imgDestino)

figure(61)
imshow(img2);
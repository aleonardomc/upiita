clear all
close all

%img = imread("gradiente.jpg");
img1 = imread("edificios3.jpg");
img1 = rgb2gray(img1);
gaussiano = imnoise(img1, 'gaussian');
impulsivo = imnoise(img1, 'salt & pepper');

% Filtro de la media
tamano_filtro = 3;
kernel_media = ones(tamano_filtro) / tamano_filtro^2;
imgFiltradaGaussiano = imfilter(gaussiano, kernel_media);
imgFiltradaImpulsivo = imfilter(impulsivo, kernel_media);

% Filtro gaussiano
tamano_filtro = 3;
desviacion = .5;                                            
kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
imgFiltradaGaussiano2 = imfilter(gaussiano, kernel_gaussiano);
imgFiltradaImpulsivo2 = imfilter(impulsivo, kernel_gaussiano);


% Filtro wavelet
wavelet = 'db1'; % Puedes probar con diferentes wavelets
niveles = 6;     % Número de niveles de descomposición
umbral = 30; % Ajusta este valor según sea necesario

[c, l] = wavedec2(gaussiano, niveles, wavelet);
%umbral = wthrmngr('dw1compGBL', c, 1);
c_suavizado = wthresh(c, 's', umbral);
imagen_reconstruida1 = waverec2(c_suavizado, l, wavelet);

[c, l] = wavedec2(impulsivo, niveles, wavelet);
%umbral = wthrmngr('dw1compGBL', c, 1);
c_suavizado = wthresh(c, 's', umbral);
imagen_reconstruida2 = waverec2(c_suavizado, l, wavelet);

figure 
nexttile
imshow(img1)
title('Imagen Original');

nexttile
imshow(gaussiano)
title('Imagen Original con ruido gaussiano');

nexttile
imshow(imgFiltradaGaussiano, [])
title('Imagen con con ruido gaussiano y filtro de media');

nexttile
imshow(imgFiltradaGaussiano2, [])
title('Imagen con con ruido gaussiano y filtro gaussiano');

nexttile
imshow(imagen_reconstruida1, [])
title('Imagen con ruido gaussiano y reducción de Ruido de Wavelet');

%

figure 
nexttile
imshow(img1)
title('Imagen Original');

nexttile
imshow(impulsivo)
title('Imagen Original con ruido impulsivo');

nexttile
imshow(imgFiltradaImpulsivo, [])
title('Imagen con con ruido impulsivo y filtro de media');

nexttile
imshow(imgFiltradaImpulsivo2, [])
title('Imagen con con ruido impulsivo y filtro gaussiano');

nexttile
imshow(imagen_reconstruida2, [])
title('Imagen con ruido impulsivo y reducción de Ruido de Wavelet');

%%
% CON 2NIVELES
wavelet = 'db1';
wavelet2 = 'haar'; 
niveles = 2;     % Número de niveles de descomposición
umbral = 30; % Ajusta este valor según sea necesario

[c, l] = wavedec2(gaussiano, niveles, wavelet);
%umbral = wthrmngr('sqtwologuwn', c, 1);
c_suavizado = wthresh(c, 's', umbral);
imagen_reconstruida1Gaussiano = waverec2(c_suavizado, l, wavelet);

[c, l] = wavedec2(gaussiano, niveles, wavelet2);
%umbral = wthrmngr('sqtwologuwn', c, 1);
c_suavizado = wthresh(c, 's', umbral);
imagen_reconstruida2Gaussiano = waverec2(c_suavizado, l, wavelet2);


figure
%nexttile
%imshow(fftshift(transformada))

nexttile
imshow(img1,[])
title('Imagen original')
nexttile
imhist(img1)
title('Histograma Imagen original')

nexttile
imshow(gaussiano,[])
title('Imagen original con ruido gaussiano')
nexttile
imhist(gaussiano)
title('Histograma Imagen original con ruido gaussiano')

nexttile
imshow(imagen_reconstruida1Gaussiano,[])
title('Wavelet DB1')
nexttile
imhist(uint8(imagen_reconstruida1Gaussiano))
title('Histograma Wavelet DB1 y con 2 niveles')

nexttile
imshow(imagen_reconstruida2Gaussiano,[])
title('Wavelet Haar')
nexttile
imhist(uint8(imagen_reconstruida2Gaussiano))
title('Histograma Wavelet Haar y con 2 niveles')

%

[c, l] = wavedec2(impulsivo, niveles, wavelet);
%umbral = wthrmngr('sqtwologuwn', c, 1);
c_suavizado = wthresh(c, 's', umbral);
imagen_reconstruida1Gaussiano = waverec2(c_suavizado, l, wavelet);

[c, l] = wavedec2(impulsivo, niveles, wavelet2);
%umbral = wthrmngr('sqtwologuwn', c, 1);
c_suavizado = wthresh(c, 's', umbral);
imagen_reconstruida2Gaussiano = waverec2(c_suavizado, l, wavelet2);

figure

nexttile
imshow(img1,[])
title('Imagen original')
nexttile
imhist(img1)
title('Histograma Imagen original')

nexttile
imshow(impulsivo,[])
title('Imagen original con ruido impulsivo')
nexttile
imhist(impulsivo)
title('Histograma Imagen original con ruido impulsivo ')

nexttile
imshow(imagen_reconstruida1Gaussiano,[])
title('Wavelet DB1')
nexttile
imhist(uint8(imagen_reconstruida1Gaussiano))
title('Histograma Wavelet DB1 y con 2 niveles')

nexttile
imshow(imagen_reconstruida2Gaussiano,[])
title('Wavelet Haar')
nexttile
imhist(uint8(imagen_reconstruida2Gaussiano))
title('Histograma Wavelet Haar y con 2 niveles')



% CON 3 NIVELES
transformada = fft2(img1);
espectro_magnitud = abs(transformada);

wavelet = 'db1';
wavelet2 = 'haar'; 
niveles = 3;     % Número de niveles de descomposición
umbral = 30; % Ajusta este valor según sea necesario

[c, l] = wavedec2(gaussiano, niveles, wavelet);
%umbral = wthrmngr('sqtwologuwn', c, 1);
c_suavizado = wthresh(c, 's', umbral);
imagen_reconstruida1Gaussiano = waverec2(c_suavizado, l, wavelet);

[c, l] = wavedec2(gaussiano, niveles, wavelet2);
%umbral = wthrmngr('sqtwologuwn', c, 1);
c_suavizado = wthresh(c, 's', umbral);
imagen_reconstruida2Gaussiano = waverec2(c_suavizado, l, wavelet2);


figure
%nexttile
%imshow(fftshift(transformada))

nexttile
imshow(img1,[])
title('Imagen original')
nexttile
imhist(img1)
title('Histograma Imagen original')

nexttile
imshow(gaussiano,[])
title('Imagen original con ruido gaussiano')
nexttile
imhist(gaussiano)
title('Histograma Imagen original con ruido gaussiano')

nexttile
imshow(imagen_reconstruida1Gaussiano,[])
title('Wavelet DB1')
nexttile
imhist(uint8(imagen_reconstruida1Gaussiano))
title('Histograma Wavelet DB1 y con 3 niveles')

nexttile
imshow(imagen_reconstruida2Gaussiano,[])
title('Wavelet Haar')
nexttile
imhist(uint8(imagen_reconstruida2Gaussiano))
title('Histograma Wavelet Haar y con 3 niveles')


% CON 3 NIVELES
wavelet = 'db1';
wavelet2 = 'haar'; 
niveles = 3;     % Número de niveles de descomposición
umbral = 30; % Ajusta este valor según sea necesario

[c, l] = wavedec2(impulsivo, niveles, wavelet);
%umbral = wthrmngr('sqtwologuwn', c, 1);
c_suavizado = wthresh(c, 's', umbral);
imagen_reconstruida1Gaussiano = waverec2(c_suavizado, l, wavelet);

[c, l] = wavedec2(impulsivo, niveles, wavelet2);
%umbral = wthrmngr('sqtwologuwn', c, 1);
c_suavizado = wthresh(c, 's', umbral);
imagen_reconstruida2Gaussiano = waverec2(c_suavizado, l, wavelet2);

figure

nexttile
imshow(img1,[])
title('Imagen original')
nexttile
imhist(img1)
title('Histograma Imagen original')

nexttile
imshow(impulsivo,[])
title('Imagen original con ruido impulsivo')
nexttile
imhist(impulsivo)
title('Histograma Imagen original con ruido impulsivo ')

nexttile
imshow(imagen_reconstruida1Gaussiano,[])
title('Wavelet DB1')
nexttile
imhist(uint8(imagen_reconstruida1Gaussiano))
title('Histograma Wavelet DB1 y con 3 niveles')

nexttile
imshow(imagen_reconstruida2Gaussiano,[])
title('Wavelet Haar')
nexttile
imhist(uint8(imagen_reconstruida2Gaussiano))
title('Histograma Wavelet Haar y con 3 niveles')









% CON 4 NIVELES
wavelet = 'db1';
wavelet2 = 'haar'; 
niveles = 4;     % Número de niveles de descomposición
umbral = 30; % Ajusta este valor según sea necesario

[c, l] = wavedec2(gaussiano, niveles, wavelet);
%umbral = wthrmngr('sqtwologuwn', c, 1);
c_suavizado = wthresh(c, 's', umbral);
imagen_reconstruida1Gaussiano = waverec2(c_suavizado, l, wavelet);

[c, l] = wavedec2(gaussiano, niveles, wavelet2);
%umbral = wthrmngr('sqtwologuwn', c, 1);
c_suavizado = wthresh(c, 's', umbral);
imagen_reconstruida2Gaussiano = waverec2(c_suavizado, l, wavelet2);


figure
%nexttile
%imshow(fftshift(transformada))

nexttile
imshow(img1,[])
title('Imagen original')
nexttile
imhist(img1)
title('Histograma Imagen original')

nexttile
imshow(gaussiano,[])
title('Imagen original con ruido gaussiano')
nexttile
imhist(gaussiano)
title('Histograma Imagen original con ruido gaussiano')

nexttile
imshow(imagen_reconstruida1Gaussiano,[])
title('Wavelet DB1')
nexttile
imhist(uint8(imagen_reconstruida1Gaussiano))
title('Histograma Wavelet DB1 y con 4 niveles')

nexttile
imshow(imagen_reconstruida2Gaussiano,[])
title('Wavelet Haar')
nexttile
imhist(uint8(imagen_reconstruida2Gaussiano))
title('Histograma Wavelet Haar y con 4 niveles')

%

[c, l] = wavedec2(impulsivo, niveles, wavelet);
%umbral = wthrmngr('sqtwologuwn', c, 1);
c_suavizado = wthresh(c, 's', umbral);
imagen_reconstruida1Gaussiano = waverec2(c_suavizado, l, wavelet);

[c, l] = wavedec2(impulsivo, niveles, wavelet2);
%umbral = wthrmngr('sqtwologuwn', c, 1);
c_suavizado = wthresh(c, 's', umbral);
imagen_reconstruida2Gaussiano = waverec2(c_suavizado, l, wavelet2);

figure

nexttile
imshow(img1,[])
title('Imagen original')
nexttile
imhist(img1)
title('Histograma Imagen original')

nexttile
imshow(impulsivo,[])
title('Imagen original con ruido impulsivo')
nexttile
imhist(impulsivo)
title('Histograma Imagen original con ruido impulsivo ')

nexttile
imshow(imagen_reconstruida1Gaussiano,[])
title('Wavelet DB1')
nexttile
imhist(uint8(imagen_reconstruida1Gaussiano))
title('Histograma Wavelet DB1 y con 4 niveles')

nexttile
imshow(imagen_reconstruida2Gaussiano,[])
title('Wavelet Haar')
nexttile
imhist(uint8(imagen_reconstruida2Gaussiano))
title('Histograma Wavelet Haar y con 4 niveles')





% CON 4 NIVELES
wavelet = 'db1';
wavelet2 = 'haar'; 
niveles = 4;     % Número de niveles de descomposición
umbral = 100; % Ajusta este valor según sea necesario

[c, l] = wavedec2(gaussiano, niveles, wavelet);
%umbral = wthrmngr('sqtwologuwn', c, 1);
c_suavizado = wthresh(c, 's', umbral);
imagen_reconstruida1Gaussiano = waverec2(c_suavizado, l, wavelet);

[c, l] = wavedec2(gaussiano, niveles, wavelet2);
%umbral = wthrmngr('sqtwologuwn', c, 1);
c_suavizado = wthresh(c, 's', umbral);
imagen_reconstruida2Gaussiano = waverec2(c_suavizado, l, wavelet2);


figure
%nexttile
%imshow(fftshift(transformada))

nexttile
imshow(img1,[])
title('Imagen original')
nexttile
imhist(img1)
title('Histograma Imagen original')

nexttile
imshow(gaussiano,[])
title('Imagen original con ruido gaussiano')
nexttile
imhist(gaussiano)
title('Histograma Imagen original con ruido gaussiano')

nexttile
imshow(imagen_reconstruida1Gaussiano,[])
title('Wavelet DB1')
nexttile
imhist(uint8(imagen_reconstruida1Gaussiano))
title('Histograma Wavelet DB1 y con 4 niveles')

nexttile
imshow(imagen_reconstruida2Gaussiano,[])
title('Wavelet Haar')
nexttile
imhist(uint8(imagen_reconstruida2Gaussiano))
title('Histograma Wavelet Haar y con 4 niveles')

%

[c, l] = wavedec2(impulsivo, niveles, wavelet);
%umbral = wthrmngr('sqtwologuwn', c, 1);
c_suavizado = wthresh(c, 's', umbral);
imagen_reconstruida1Gaussiano = waverec2(c_suavizado, l, wavelet);

[c, l] = wavedec2(impulsivo, niveles, wavelet2);
%umbral = wthrmngr('sqtwologuwn', c, 1);
c_suavizado = wthresh(c, 's', umbral);
imagen_reconstruida2Gaussiano = waverec2(c_suavizado, l, wavelet2);

figure

nexttile
imshow(img1,[])
title('Imagen original')
nexttile
imhist(img1)
title('Histograma Imagen original')

nexttile
imshow(impulsivo,[])
title('Imagen original con ruido impulsivo')
nexttile
imhist(impulsivo)
title('Histograma Imagen original con ruido impulsivo ')

nexttile
imshow(imagen_reconstruida1Gaussiano,[])
title('Wavelet DB1')
nexttile
imhist(uint8(imagen_reconstruida1Gaussiano))
title('Histograma Wavelet DB1 y con 4 niveles')

nexttile
imshow(imagen_reconstruida2Gaussiano,[])
title('Wavelet Haar')
nexttile
imhist(uint8(imagen_reconstruida2Gaussiano))
title('Histograma Wavelet Haar y con 4 niveles')
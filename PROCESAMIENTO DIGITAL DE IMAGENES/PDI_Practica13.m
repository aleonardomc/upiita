clear all
close all

%% Filtro media
%img1 = imread('fotoAntigua.jpg');
%img1 = imread('pato.jpg');
%img1 = imread('cielo5.png');
img1 = imread('edificios.jpg');

gaussiano = imnoise(img1, 'gaussian', 0, .05);
impulsivo = imnoise(img1, 'salt & pepper', .02);
tamanio_ventana = [3, 3]; % Puedes ajustar el tamaño de la ventana según tus necesidades

canal_rojoG = gaussiano(:,:,1);
canal_verdeG = gaussiano(:,:,2);
canal_azulG = gaussiano(:,:,3);
% Aplicar el filtro de la mediana a cada canal
canal_rojo_filtradoG = medfilt2(canal_rojoG, tamanio_ventana);
canal_verde_filtradoG = medfilt2(canal_verdeG, tamanio_ventana);
canal_azul_filtradoG = medfilt2(canal_azulG, tamanio_ventana);
% Combinar los canales filtrados de nuevo en una imagen a color
imgFiltradaGaussiano = cat(3, canal_rojo_filtradoG, canal_verde_filtradoG, canal_azul_filtradoG);


canal_rojoI = impulsivo(:,:,1);
canal_verdeI = impulsivo(:,:,2);
canal_azulI = impulsivo(:,:,3);
% Aplicar el filtro de la mediana a cada canal
canal_rojo_filtradoI = medfilt2(canal_rojoI, tamanio_ventana);
canal_verde_filtradoI = medfilt2(canal_verdeI, tamanio_ventana);
canal_azul_filtradoI = medfilt2(canal_azulI, tamanio_ventana);
% Combinar los canales filtrados de nuevo en una imagen a color
imgFiltradaImpulsivo = cat(3, canal_rojo_filtradoI, canal_verde_filtradoI, canal_azul_filtradoI);




% Mostrar la imagen original y la imagen filtrada
figure;
nexttile;
imshow(img1)
title('Imagen Original');

nexttile;
imshow(gaussiano)
title('Imagen con ruido gaussiano');

nexttile;
imshow(imgFiltradaGaussiano)
title('Imagen con filtro de mediana y ruido gaussiano');



figure;
nexttile;
imshow(img1)
title('Imagen Original');

nexttile;
imshow(impulsivo)
title('Imagen con ruido impulsivo');

nexttile;
imshow(imgFiltradaGaussiano)
title('Imagen con filtro de mediana y ruido impulsivo');




%% Puntos aislados
clear all
close all

img1 = imread("fondoBlanco.png");
% max 1530, -1530

%max 4335, 0
%mascara = [255 255 255; 255 -2040 255; 255 255 255];
mascara = [-1 -1 -1; -1 8 -1; -1 -1 -1];
mascara = -mascara;

resultado = imfilter(img1, mascara);
img1 = rgb2gray(img1);
figure
nexttile;
imshow(img1);

nexttile;
imshow(resultado);

% Obtener el tamaño de la imagen y la máscara
[alto, ancho] = size(img1);

% Inicializar la matriz para almacenar los resultados
resultados = zeros(alto, ancho);

% Aplicar la máscara y sumar pixel por pixel
for i = 2:alto-1
    for j = 2:ancho-1
        subimagen = double(img1(i-1:i+1, j-1:j+1));
        resultados(i, j) = sum(sum(subimagen .* mascara));
    end
end

umbral = 7;
imagen_binaria = double(resultados) <= umbral;

% Mostrar la imagen original y el resultado de la convolución
figure (1);
subplot(311)
imshow(img1)
title('Imagen Original');
subplot(312)
imshow(resultados)
title('Resultado de la Máscara');
subplot(313)
imshow(imagen_binaria)
title('Resultado de la Máscara con umbral');


%% Puntos aislados negros
clear all
close all

img1 = imread("fondoNegro.png");
% max 1530, -1530

%max 4335, 0
%mascara = [255 255 255; 255 -2040 255; 255 255 255];
mascara = [-1 -1 -1; -1 8 -1; -1 -1 -1];

resultado = imfilter(img1, mascara);
img1 = rgb2gray(img1);
figure
nexttile;
imshow(img1);

nexttile;
imshow(resultado);

% Obtener el tamaño de la imagen y la máscara
[alto, ancho] = size(img1);

% Inicializar la matriz para almacenar los resultados
resultados = zeros(alto, ancho);

% Aplicar la máscara y sumar pixel por pixel
for i = 2:alto-1
    for j = 2:ancho-1
        subimagen = double(img1(i-1:i+1, j-1:j+1));
        resultados(i, j) = sum(sum(subimagen .* mascara));
    end
end

umbral = 9;
imagen_binaria = double(resultados) <= umbral;

% Mostrar la imagen original y el resultado de la convolución
figure (1);
subplot(311)
imshow(img1)
title('Imagen Original');
subplot(312)
imshow(resultados)
title('Resultado de la Máscara');
subplot(313)
imshow(imagen_binaria)
title('Resultado de la Máscara con umbral');



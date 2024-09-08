clear all 
close all

%Para imnoise:
%     1. Para el ruido gaussiano se usa la y la media que por defecto es  0 y la varianza 
%     2. Para el ruido impulsivo y multiplicativo se usa densidad de ruido
%     3. Para el ruido multiplicativo tambien se usa la varianza

%Una varianza mayor resulta en una función de distribución más ancha, lo que implica un suavizado más suave pero también un mayor alcance espacial.
%El tamaño de la ventana no tiene limite en matlab siempre y cuando sea
%menor o igual al tamaño de la imagen






%% Filtro media
%img1 = imread('fotoAntigua.jpg');
%img1 = imread('pato.jpg');
img1 = imread('cielo5.png');

gaussiano = imnoise(img1, 'gaussian', 0, .1);
impulsivo = imnoise(img1, 'salt & pepper', .1);
multiplicativo = imnoise(img1,'speckle', 05);

tamano_filtro = 3;
kernel_media = ones(tamano_filtro) / tamano_filtro^2;
imgFiltradaGaussiano = imfilter(gaussiano, kernel_media);
imgFiltradaImpulsivo = imfilter(impulsivo, kernel_media);
imgFiltradaMultiplicativo = imfilter(multiplicativo, kernel_media);

%% Filtro gaussiano
tamano_filtro = 3;
desviacion = .5;                                            
kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
imgFiltradaGaussiano2 = imfilter(gaussiano, kernel_gaussiano);
imgFiltradaImpulsivo2 = imfilter(impulsivo, kernel_gaussiano);

% Conectividad 4
%img1 = imread('fotoAntigua.jpg');
mascara_conectividad_4 = [0, 1, 0; 1, 0, 1; 0, 1, 0];
mascara_conectividad_4 = mascara_conectividad_4 / sum(mascara_conectividad_4(:));
disp('Máscara de conectividad 4:');
disp(mascara_conectividad_4)
imgFiltradaGaussiano3 = imfilter(gaussiano, mascara_conectividad_4);
imgFiltradaImpulsivo3 = imfilter(impulsivo, mascara_conectividad_4);

%% Conectividad 8 
%img1 = imread('fotoAntigua.jpg');
mascara_conectividad_8 = [sqrt(2), 1, sqrt(2); 1, 0, 1; sqrt(2), 1, sqrt(2)];
mascara_conectividad_8 = mascara_conectividad_8 / sum(mascara_conectividad_8(:));

%mascara_conectividad_8 = rand(3,3);
%mascara_conectividad_8 = mascara_conectividad_8 / sum(mascara_conectividad_8(:));

disp('Máscara de conectividad 8:');
disp(mascara_conectividad_8);
imgFiltradaGaussiano4 = imfilter(gaussiano, mascara_conectividad_8);
imgFiltradaImpulsivo4 = imfilter(impulsivo, mascara_conectividad_8);

figure
nexttile;
imshow(img1)
title 'Imagen Original'

nexttile;
imshow(gaussiano)
title 'Imagen con ruido gaussiano'

nexttile;
imshow(imgFiltradaGaussiano)
title 'Imagen con ruido gaussiano y filtro de media'

nexttile
imshow(imgFiltradaGaussiano2)
title 'Imagen con ruido gaussiano y filtro gaussiano'

nexttile
imshow(imgFiltradaGaussiano3)
title 'Imagen con ruido gaussiano y filtro de conectividad 4'

nexttile
imshow(imgFiltradaGaussiano4)
title 'Imagen con ruido gaussiano y filtro de conectividad 8'



figure
nexttile;
imshow(img1)
title 'Imagen Original'

nexttile;
imshow(impulsivo)
title 'Imagen con ruido impulsivo'

nexttile;
imshow(imgFiltradaImpulsivo)
title 'Imagen con ruido impulsivo y filtro de media'

nexttile
imshow(imgFiltradaImpulsivo2)
title 'Imagen con ruido impulsivo y filtro gaussiano'

nexttile
imshow(imgFiltradaImpulsivo3)
title 'Imagen con ruido impulsivo y filtro de conectividad 4'

nexttile
imshow(imgFiltradaImpulsivo4)
title 'Imagen con ruido impulsivo y filtro de conectividad 8'




%% Filtro gaussiano e impulsivo con diferentes parametros


img1 = imread('pato.jpg');

gaussiano = imnoise(img1, 'gaussian', 0, .1);
impulsivo = imnoise(img1, 'salt & pepper', .3);

figure
nexttile;
imshow(img1)
title 'Imagen Original'

nexttile;
imshow(gaussiano)
title 'Imagen con ruido gaussiano'

tamano_filtro = 3;
desviacion = .5;                                            
kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
imgFiltradaGaussiano2 = imfilter(gaussiano, kernel_gaussiano);
nexttile
imshow(imgFiltradaGaussiano2)
title ("Tamaño de la ventana de: " + num2str(tamano_filtro) + " y desviacion de: " + desviacion)

tamano_filtro = 3;
desviacion = 10;                                            
kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
imgFiltradaGaussiano2 = imfilter(gaussiano, kernel_gaussiano);
nexttile
imshow(imgFiltradaGaussiano2)
title ("Tamaño de la ventana de: " + num2str(tamano_filtro) + " y desviacion de: " + desviacion)

tamano_filtro = 3;
desviacion = 30;                                            
kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
imgFiltradaGaussiano2 = imfilter(gaussiano, kernel_gaussiano);
nexttile
imshow(imgFiltradaGaussiano2)
title ("Tamaño de la ventana de: " + num2str(tamano_filtro) + " y desviacion de: " + desviacion)

tamano_filtro = 10;
desviacion = .5;                                            
kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
imgFiltradaGaussiano2 = imfilter(gaussiano, kernel_gaussiano);
nexttile
imshow(imgFiltradaGaussiano2)
title ("Tamaño de la ventana de: " + num2str(tamano_filtro) + " y desviacion de: " + desviacion)

tamano_filtro = 10;
desviacion = 10;                                            
kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
imgFiltradaGaussiano2 = imfilter(gaussiano, kernel_gaussiano);
nexttile
imshow(imgFiltradaGaussiano2)
title ("Tamaño de la ventana de: " + num2str(tamano_filtro) + " y desviacion de: " + desviacion)

tamano_filtro = 10;
desviacion = 30;                                            
kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
imgFiltradaGaussiano2 = imfilter(gaussiano, kernel_gaussiano);
nexttile
imshow(imgFiltradaGaussiano2)
title ("Tamaño de la ventana  de: " + num2str(tamano_filtro) + " y desviacion de: " + desviacion)

tamano_filtro = 30;
desviacion = 30;                                            
kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
imgFiltradaGaussiano2 = imfilter(gaussiano, kernel_gaussiano);
nexttile
imshow(imgFiltradaGaussiano2)
title ("Tamaño de la ventana  de: " + num2str(tamano_filtro) + " y desviacion de: " + desviacion)




figure
nexttile;
imshow(img1)
title 'Imagen Original'

nexttile;
imshow(impulsivo)
title 'Imagen con ruido Impusilvo'

tamano_filtro = 3;
desviacion = .5;                                            
kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
imgFiltradaImpulsivo2 = imfilter(impulsivo, kernel_gaussiano);
nexttile
imshow(imgFiltradaImpulsivo2)
title ("Tamaño de la ventana de: " + num2str(tamano_filtro) + " y desviacion de: " + desviacion)

tamano_filtro = 3;
desviacion = 10;                                            
kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
imgFiltradaImpulsivo2 = imfilter(impulsivo, kernel_gaussiano);
nexttile
imshow(imgFiltradaImpulsivo2)
title ("Tamaño de la ventana de: " + num2str(tamano_filtro) + " y desviacion de: " + desviacion)

tamano_filtro = 3;
desviacion = 30;                                            
kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
imgFiltradaImpulsivo2 = imfilter(impulsivo, kernel_gaussiano);
nexttile
imshow(imgFiltradaImpulsivo2)
title ("Tamaño de la ventana de: " + num2str(tamano_filtro) + " y desviacion de: " + desviacion)

tamano_filtro = 10;
desviacion = .5;                                            
kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
imgFiltradaImpulsivo2 = imfilter(impulsivo, kernel_gaussiano);
nexttile
imshow(imgFiltradaImpulsivo2)
title ("Tamaño de la ventana de: " + num2str(tamano_filtro) + " y desviacion de: " + desviacion)

tamano_filtro = 10;
desviacion = 10;                                            
kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
imgFiltradaImpulsivo2 = imfilter(impulsivo, kernel_gaussiano);
nexttile
imshow(imgFiltradaImpulsivo2)
title ("Tamaño de la ventana de: " + num2str(tamano_filtro) + " y desviacion de: " + desviacion)

tamano_filtro = 10;
desviacion = 30;                                            
kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
imgFiltradaImpulsivo2 = imfilter(impulsivo, kernel_gaussiano);
nexttile
imshow(imgFiltradaImpulsivo2)
title ("Tamaño de la ventana  de: " + num2str(tamano_filtro) + " y desviacion de: " + desviacion)

tamano_filtro = 30;
desviacion = 30;                                            
kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
imgFiltradaImpulsivo2 = imfilter(impulsivo, kernel_gaussiano);
nexttile
imshow(imgFiltradaImpulsivo2)
title ("Tamaño de la ventana  de: " + num2str(tamano_filtro) + " y desviacion de: " + desviacion)

 
% %% Opciones de imfilter para las fronteras
% clear all
% close all
% 
% img1 = imread('cielo1.jpg');
% 
% gaussiano = img1;
% 
% figure
% nexttile;
% imshow(img1)
% title 'Imagen Original'
% 
% tamano_filtro = 3;
% desviacion = .5;                                            
% kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
% imgFiltradaGaussiano2 = imfilter(gaussiano, kernel_gaussiano);
% nexttile
% imshow(imgFiltradaGaussiano2)
% title 'Imagen con filtro sin opcion de frontera'
% 
% tamano_filtro = 3;
% desviacion = .5;                                            
% kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
% imgFiltradaGaussiano2 = imfilter(gaussiano, kernel_gaussiano, 'replicate');
% nexttile
% imshow(imgFiltradaGaussiano2)
% title 'Imagen con filtro usando replicate'
% % Repetir el valor del píxel más cercano en el borde.
% % Útil cuando se desea extender los valores de los píxeles en el borde utilizando los valores más cercanos de la imagen.
% 
% tamano_filtro = 3;
% desviacion = .5;                                            
% kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
% imgFiltradaGaussiano2 = imfilter(gaussiano, kernel_gaussiano, 'symmetric');
% nexttile
% imshow(imgFiltradaGaussiano2)
% title 'Imagen con filtro usando symmetric'
% % Reflejar la imagen a lo largo del borde.
% % Útil cuando se desea mantener la simetría alrededor del borde.
% 
% 
% tamano_filtro = 3;
% desviacion = .5;                                            
% kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
% imgFiltradaGaussiano2 = imfilter(gaussiano, kernel_gaussiano, 'circular');
% nexttile
% imshow(imgFiltradaGaussiano2)
% title 'Imagen con filtro usando circular'
% % Tratar la imagen como si estuviera envuelta en un patrón circular.
% % Útil cuando se desea mantener la simetría alrededor del borde.
% 
% 
% 
% 





% clear all 
% close all
% 
% %% Filtro media
% clear all
% close all
% img1 = imread('fotoAntigua.jpg');
% gaussiano = imnoise(img1, 'gaussian', 0, .1);
% impulsivo = imnoise(img1, 'salt & pepper', .05);
% multiplicativo = imnoise(img1,'speckle', 05);
% 
% tamano_filtro = 3;
% kernel_media = ones(tamano_filtro) / tamano_filtro^2;
% imgFiltradaGaussiano = imfilter(gaussiano, kernel_media);
% imgFiltradaImpulsivo = imfilter(impulsivo, kernel_media);
% imgFiltradaMultiplicativo = imfilter(multiplicativo, kernel_media);
% 
% figure
% nexttile;
% imshow(img1)
% title 'Imagen Original'
% 
% figure
% nexttile;
% imshow(gaussiano)
% title 'Imagen con ruido gaussiano'
% nexttile;
% imshow(imgFiltradaGaussiano)
% title 'Imagen con ruido gaussiano y filtro de media'
% 
% figure
% nexttile;
% imshow(impulsivo)
% title 'Imagen con ruido impulsivo'
% nexttile;
% imshow(imgFiltradaImpulsivo)
% title 'Imagen con ruido impulsivo y filtro de media'
% % 
% % figure
% % nexttile;
% % imshow(multiplicativo)
% % title 'Imagen con ruido multiplicativo'
% % nexttile;
% % imshow(imgFiltradaMultiplicativo)
% % title 'Imagen con  ruido multiplicativo y filtro de media'
% 
% 
% %% Filtro gaussiano
% tamano_filtro = 3;
% desviacion = .5;
% kernel_gaussiano = fspecial('gaussian', tamano_filtro, desviacion);
% imgFiltradaGaussiano = imfilter(gaussiano, kernel_gaussiano);
% imgFiltradaImpulsivo = imfilter(impulsivo, kernel_gaussiano);
% 
% figure
% nexttile;
% imshow(gaussiano)
% title 'Imagen con ruido gaussiano'
% nexttile;
% imshow(imgFiltradaGaussiano)
% title 'Imagen con ruido gaussiano y  filtro gaussiano'
% 
% figure
% nexttile;
% imshow(impulsivo)
% title 'Imagen con ruido impulsivo'
% nexttile;
% imshow(imgFiltradaImpulsivo)
% title 'Imagen con ruido impulsivo y  filtro gaussiano'
% 
% 
% %% Conectividad 4
% %img1 = imread('fotoAntigua.jpg');
% mascara_conectividad_4 = [0, 1, 0; 1, 1, 1; 0, 1, 0];
% mascara_conectividad_4 = mascara_conectividad_4 / sum(mascara_conectividad_4(:));
% disp(mascara_conectividad_4)
% imgFiltradaGaussiano = imfilter(gaussiano, mascara_conectividad_4);
% imgFiltradaImpulsivo = imfilter(impulsivo, mascara_conectividad_4);
% 
% figure
% nexttile;
% imshow(gaussiano)
% title 'Imagen con ruido gaussiano'
% nexttile;
% imshow(imgFiltradaGaussiano)
% title 'Imagen con ruido gaussiano y filtro de conectividad 4'
% 
% figure
% nexttile;
% imshow(impulsivo)
% title 'Imagen con ruido impulsivo'
% nexttile;
% imshow(imgFiltradaImpulsivo)
% title 'Imagen con ruido impulsivo y filtro de conectividad 4'
% 
% 
% %% Conectividad 8
% %img1 = imread('fotoAntigua.jpg');
% gaussiano = imnoise(img1, 'gaussian', 0, .1);
% impulsivo = imnoise(img1, 'salt & pepper', .05);
% 
% % Especifica la máscara de conectividad 8
% mascara_conectividad_8 = [1, sqrt(2), 1; sqrt(2), 0, sqrt(2); 1, sqrt(2), 1];
% 
% % Normaliza la máscara para que sume 1
% mascara_conectividad_8 = mascara_conectividad_8 / sum(mascara_conectividad_8(:));
% 
% % Muestra la máscara
% disp('Máscara de conectividad 8:');
% disp(mascara_conectividad_8);
% imgFiltradaGaussiano = imfilter(gaussiano, mascara_conectividad_8);
% imgFiltradaImpulsivo = imfilter(impulsivo, mascara_conectividad_8);
% 
% figure
% nexttile;
% imshow(gaussiano)
% title 'Imagen con ruido gaussiano'
% nexttile;
% imshow(imgFiltradaGaussiano)
% title 'Imagen con ruido gaussiano y filtro de conectividad 8'
% 
% figure
% nexttile;
% imshow(impulsivo)
% title 'Imagen con ruido impulsivo'
% nexttile;
% imshow(imgFiltradaImpulsivo)
% title 'Imagen con ruido impulsivo y filtro de conectividad 8'

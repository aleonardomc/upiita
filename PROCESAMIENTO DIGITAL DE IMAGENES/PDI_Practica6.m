clear all 
close all

img = imread('paisaje.jpg');
img
img = imread('x.bmp')
imgRotada = imrotate(img,-30);

figure(1)
imshow(imgRotada)

% Cargar la imagen
imagen = img;

% Especificar el ángulo de rotación en grados
angulo = 30; % Cambia el valor según sea necesario

% Convertir el ángulo de grados a radianes
angulo_radianes = deg2rad(angulo);

% Calcular las dimensiones de la imagen de salida
[alto, ancho, ~] = size(imagen);
nuevo_ancho = ceil(abs(ancho * cos(angulo_radianes)) + abs(alto * sin(angulo_radianes)));
nuevo_alto = ceil(abs(ancho * sin(angulo_radianes)) + abs(alto * cos(angulo_radianes)));

% Calcular el centro de la imagen original y de la imagen de salida
centro_original = [ancho / 2, alto / 2];
centro_salida = [nuevo_ancho / 2, nuevo_alto / 2];

% Crear una matriz vacía para la imagen de salida
imagen_rotada = zeros(nuevo_alto, nuevo_ancho, size(imagen, 3));

% Calcular la transformación de coordenadas inversa
for y = 1:nuevo_alto
    for x = 1:nuevo_ancho
        x_original = (x - centro_salida(1)) * cos(-angulo_radianes) - (y - centro_salida(2)) * sin(-angulo_radianes) + centro_original(1);
        y_original = (x - centro_salida(1)) * sin(-angulo_radianes) + (y - centro_salida(2)) * cos(-angulo_radianes) + centro_original(2);
        
        % Interpolar los valores de píxeles usando interpolación bilineal
        if x_original >= 1 && y_original >= 1 && x_original <= ancho && y_original <= alto
            imagen_rotada(y, x, :) = bilinear_interpolation(imagen, x_original, y_original);
        end
    end
end

% Mostrar la imagen rotada
figure(2)
imshow(uint8(imagen_rotada));

function valor_interpolado = bilinear_interpolation(imagen, x, y)
    x1 = floor(x);
    x2 = x1 + 1;
    y1 = floor(y);
    y2 = y1 + 1;

    % Coeficientes de interpolación
    dx1 = x - x1;
    dx2 = x2 - x;
    dy1 = y - y1;
    dy2 = y2 - y;

    % Valores de píxeles en las esquinas
    pixel11 = imagen(y1, x1, :);
    pixel12 = imagen(y1, x2, :);
    pixel21 = imagen(y2, x1, :);
    pixel22 = imagen(y2, x2, :);

    % Interpolación bilineal
    valor_interpolado = dx2 * (dy2 * pixel11 + dy1 * pixel21) + dx1 * (dy2 * pixel12 + dy1 * pixel22);
end
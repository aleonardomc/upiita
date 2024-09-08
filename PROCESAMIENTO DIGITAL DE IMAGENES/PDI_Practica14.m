clear all
close all

%img = imread("gradiente.jpg");
img = imread("edificios3.jpg");
%img = imread("gradiente2.jpg");

img = rgb2gray(img);
[Gmag, Gdir] = imgradient(img);
[Gmagxy, Gdirxy] = imgradientxy(img);

figure
nexttile
imshow(img)
title 'Imagen original'
nexttile
imshow(Gmag)
title 'Magnitud del gradiente'
nexttile
imshow(Gdir)
title 'Direccion del gradiente'
nexttile
imshow(Gmagxy)
title 'Magnitud del gradiente horizontal'
nexttile
imshow(Gdirxy)
title 'Magnitud del gradiente vertical'

figure
nexttile
imshow(img)
title 'Imagen original'
nexttile
imshow(Gmag,[])
title 'Magnitud del gradiente con escalado'
nexttile
imshow(Gdir,[])
title 'Direccion del gradiente con escalado'
nexttile
imshow(Gmagxy,[])
title 'Magnitud del gradiente horizontal con escalado'
nexttile
imshow(Gdirxy,[])
title 'Magnitud del gradiente vertical con escalado'


% imgradientxy Prewitt

[Gmag, Gdir] = imgradient(img, "prewitt");
[Gmagxy, Gdirxy] = imgradientxy(img, "prewitt");

figure
nexttile
imshow(img)
title 'Imagen original'
nexttile
imshow(Gmag)
title 'Magnitud del gradiente con prewitt'
nexttile
imshow(Gdir)
title 'Direccion del gradiente con prewitt'
nexttile
imshow(Gmagxy)
title 'Magnitud del gradiente horizontal con prewitt'
nexttile
imshow(Gdirxy)
title 'Magnitud del gradiente vertical con prewitt'

figure
nexttile
imshow(img)
title 'Imagen original'
nexttile
imshow(Gmag,[])
title 'Magnitud del gradiente con escalado con prewitt'
nexttile
imshow(Gdir,[])
title 'Direccion del gradiente con escalado con prewitt'
nexttile
imshow(Gmagxy,[])
title 'Magnitud del gradiente horizontal con escalado con prewitt'
nexttile
imshow(Gdirxy,[])
title 'Magnitud del gradiente vertical con escalado con prewitt'


% Intermediate

[Gmag, Gdir] = imgradient(img, "intermediate");
[Gmagxy, Gdirxy] = imgradientxy(img, "intermediate");

figure
nexttile
imshow(img)
title 'Imagen original'
nexttile
imshow(Gmag)
title 'Magnitud del gradiente con intermediate'
nexttile
imshow(Gdir)
title 'Direccion del gradiente con intermediate'
nexttile
imshow(Gmagxy)
title 'Magnitud del gradiente horizontal con intermediate'
nexttile
imshow(Gdirxy)
title 'Magnitud del gradiente vertical con intermediate'

figure
nexttile
imshow(img)
title 'Imagen original'
nexttile
imshow(Gmag,[])
title 'Magnitud del gradiente con escalado con intermediate'
nexttile
imshow(Gdir,[])
title 'Direccion del gradiente con escalado con intermediate'
nexttile
imshow(Gmagxy,[])
title 'Magnitud del gradiente horizontal con escalado con intermediate'
nexttile
imshow(Gdirxy,[])
title 'Magnitud del gradiente vertical con escalado con intermediate'

% Propuesto
phi = (1 + sqrt(5)) /2;
k = 1/sqrt(phi);
mask_x = [1, 0, -1; k, 0, k; 1, 0, -1];
maks_y = [-1, -k, -1; 0, 0, 0; 1, k, 1];


gradiente_xp = conv2(img, mask_x, 'same');
gradiente_yp = conv2(img, maks_y, 'same');


figure
nexttile;
imshow(gradiente_xp)
title("Gradiente Gx con la propuesta")

nexttile;
imshow(gradiente_yp)
title("Gradiente Gy con la propuesta")

nexttile;
imshow(gradiente_xp,[])
title("Escalado de la imagen")

nexttile;
imshow(gradiente_yp,[])
title("Gradiente Gy con la propuesta")




pkg load image

img = imread("labirinto.jpeg");
figure;
imshow(img)
title("Imagem original do labirinto");

if size(img, 3) == 3
  img = rgb2gray(img);
endif

limiar = 128;

B = img > limiar;

figure;
imshow(B);
title('Imagem binária do labirinto');
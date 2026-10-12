pkg load image

function [x_centro, y_centro] = obter_centro_celula(i, j)
  imagem = imread("labirinto_41x41.png");
  quantidade_blocos_x = 41;
  quantidade_blocos_y = quantidade_blocos_x;

  [altura_imagem, comprimento_imagem, ~] = size(imagem);

  delta_x = comprimento_imagem / quantidade_blocos_x;
  delta_y = altura_imagem / quantidade_blocos_y;

  x_centro = (i - 0.5) * delta_x;
  y_centro = (j - 0.5) * delta_y;
end

obter_centro_celula(2, 1);
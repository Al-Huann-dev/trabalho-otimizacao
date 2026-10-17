function [x_centro, y_centro] = calcular_centro_celula(B, i, j, n_celulas)
  if nargin < 4 || isempty(n_celulas)
    n_celulas = 41;
  end

  n = n_celulas;

  [altura_imagem, comprimento_imagem, ~] = size(B);

  delta_x = comprimento_imagem / n;
  delta_y = altura_imagem / n;

  x_centro = round((j - 0.5) * delta_x);
  y_centro = round((i - 0.5) * delta_y);
end

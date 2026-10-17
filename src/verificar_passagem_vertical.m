function tem_passagem = verificar_passagem_vertical(B, i1, i2, j, n_celulas)
  if nargin < 5 || isempty(n_celulas)
    n_celulas = 41;
  endif

  [x1, y1] = calcular_centro_celula(B, i1, j, n_celulas);
  [~, y2] = calcular_centro_celula(B, i2, j, n_celulas);

  y_inicio = min(y1, y2);
  y_fim = max(y1, y2);

  coluna_pixel = B(y_inicio:y_fim, x1);
  tem_passagem = all(coluna_pixel == 1);
end

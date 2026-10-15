function tem_passagem = verificar_passagem_vertical(B, i1, i2, j, n_celulas)
  if nargin < 5 || isempty(n_celulas)
    n_celulas = 41;
  endif

  [x1, y1] = obter_centro_celula(B, i1, j, n_celulas);
  [~, y2] = obter_centro_celula(B, i2, j, n_celulas);

  y_inicio = min(y1, y2);
  y_fim = max(y1, y2);

  coluna_pixels = B(y_inicio:y_fim, x1);
  media_pixels = mean(coluna_pixels);
  tem_passagem = media_pixels > 0.5;
end

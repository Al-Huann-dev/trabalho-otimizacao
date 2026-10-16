function tem_passagem = verificar_passagem_horizontal(B, i, j1, j2, n_celulas)
  if nargin < 5 || isempty(n_celulas)
    n_celulas = 41;
  endif

  [x1, y1] = obter_centro_celula(B, i, j1, n_celulas);
  [x2, ~] = obter_centro_celula(B, i, j2, n_celulas);

  x_inicio = min(x1, x2);
  x_fim = max(x1, x2);

  linha_pixel = B(y1, x_inicio:x_fim);
  tem_passagem = all(linha_pixel == 1);
end

% Parte 2 / item c), d) e e)
function [arestas, qtd_arestas] = obter_arestas(B, n_celulas)
  if nargin < 2 || isempty(n_celulas)
    n_celulas = 41;
  end

  n = n_celulas;

  max_arestas = 2 * n^2;
  arestas_temp = zeros(max_arestas, 2);
  qtd_arestas = 0;

  for i = 1:n
    for j = 1:n
      if j < n
        if verificar_passagem_horizontal(B, i, j, j + 1, n)
          id_u = calcular_id_no(n, i, j);
          id_v = calcular_id_no(n, i, j + 1);
          qtd_arestas = qtd_arestas + 1;

          arestas_temp(qtd_arestas, :) = [id_u, id_v];
        endif
      endif
      if i < n
        if verificar_passagem_vertical(B, i, i + 1, j, n)
          id_u = calcular_id_no(n, i, j);
          id_v = calcular_id_no(n, i + 1, j);
          qtd_arestas = qtd_arestas + 1;

          arestas_temp(qtd_arestas, :) = [id_u, id_v];
        endif
      endif
    end
  end

  arestas = arestas_temp(1:qtd_arestas, :);
end

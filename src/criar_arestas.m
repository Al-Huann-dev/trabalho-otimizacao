function arestas = criar_arestas(B, n_blocos)
  if nargin < 2 || isempty(n_blocos)
    n_blocos = 41;
  end

  arestas = [];

  [n_linhas, n_colunas] = size(B);
  n = n_blocos;

  max_arestas = 2 * n^2;
  arestas_temp = zeros(max_arestas, 2);
  qtd_arestas = 0;

  for i = 1:n
    for j = 1:n
      if j < n
        if verificar_passagem_horizontal(B, i, j, j + 1)
          id_u = criar_id_no(n, i, j);
          id_v = criar_id_no(n, i, j + 1);
          qtd_arestas = qtd_arestas + 1;

          arestas(qtd_arestas, :) = [id_u, id_v];
        end
      end
      if i < n
        if verificar_passagem_vertical(B, i, i + 1, j)
          id_u = criar_id_no(n, i, j);
          id_v = criar_id_no(n, i + 1, j);
          qtd_arestas = qtd_arestas + 1;

          arestas(qtd_arestas, :) = [id_u, id_v];
        end
      end
    end
  end
end

function arestas = criar_arestas(B)
  arestas = [];

  [n_linhas, n_colunas] = size(B);
  n = n_linhas;

  for i = 1:n_linhas
    for j = 1:n_colunas
      if j < n_colunas
        if verificar_passagem_horizontal(B, i, j, j + 1)
          id_u = criar_id_no(n, i, j);
          id_v = criar_id_no(n, i, j + 1);
          arestas(end + 1, :) = [id_u, id_v];
        end
      end
      if i < n_linhas
        if verificar_passagem_vertical(B, i, i + 1, j)
          id_u = criar_id_no(n, i, j);
          id_v = criar_id_no(n, i + 1, j);

          arestas(end + 1, :) = [id_u, id_v];
        end
      end
    end
  end
end

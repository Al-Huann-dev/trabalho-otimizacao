function ok = test_reconstruir_caminho()
  fprintf("Executando: test_reconstruir_caminho... ");

  % --- CENÁRIO MOCK (Grafo de 4 Nós em Linha) ---
  %  (1) <---> (2) <---> (3) <---> (4)
  N = 4;
  u = [1, 2, 3];
  v = [2, 3, 4];
  
  % Grafo não-direcionado com conexões simples
  A = sparse([u, v], [v, u], 1, N, N);

  origem = 1;
  destino = 4;

  % --- EXECUÇÃO ---
  [~, anterior] = dijkstra(A, origem);
  caminho_calculado = reconstruir_caminho(anterior, origem, destino);

  % --- VALIDAÇÕES ---
  caminho_esperado = [1, 2, 3, 4];

  % 1. O caminho gerado deve ser exatamente [1, 2, 3, 4]
  t1 = isequal(caminho_calculado, caminho_esperado);

  % 2. O tamanho do caminho retornado deve ser 4 nós
  t2 = (length(caminho_calculado) == 4);

  % 3. O primeiro elemento do caminho deve ser a origem
  t3 = (caminho_calculado(1) == origem);

  % 4. O último elemento do caminho deve ser o destino
  t4 = (caminho_calculado(end) == destino);

  ok = (t1 && t2 && t3 && t4);

  if ok
    fprintf("[OK]\n");
  else
    fprintf("[FALHOU]\n");
  endif
end
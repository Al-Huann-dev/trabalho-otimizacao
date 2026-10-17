function ok = test_dijkstra()
  fprintf("Executando: test_dijkstra... ");

  % --- CENÁRIO MOCK (Grafo de 5 Nós com Pesos) ---
  %  (1) --- 2 ---> (2) --- 1 ---> (3)
  %   |              |              |
  %   4              1              5
  %   v              v              v
  %  (4) ---------- 1 ------------> (5)
  N = 5;
  u = [1, 2, 1, 2, 3, 4];
  v = [2, 3, 4, 5, 5, 5];
  w = [2, 1, 4, 1, 5, 1];

  % Grafo não-direcionado (simétrico)
  A = sparse([u, v], [v, u], [w, w], N, N);

  % --- EXECUÇÃO ---
  origem = 1;
  [dist, anterior] = dijkstra(A, origem);

  % --- VALIDAÇÕES ---
  % 1. Distância até o nó de origem (1) deve ser 0
  t1 = (dist(1) == 0);

  % 2. Distância até o nó 3 deve ser 3 (caminho 1 -> 2 -> 3)
  t2 = (dist(3) == 3);

  % 3. Distância mínima até o nó destino (5) deve ser 3 (caminho 1 -> 2 -> 5)
  t3 = (dist(5) == 3);

  % 4. O predecessor imediato do nó 5 no caminho mínimo deve ser o nó 2
  t4 = (anterior(5) == 2);

  % 5. O predecessor do nó 2 no caminho mínimo deve ser a origem 1
  t5 = (anterior(2) == 1);

  ok = (t1 && t2 && t3 && t4 && t5);

  if ok
    fprintf("[OK]\n");
  else
    fprintf("[FALHOU]\n");
  endif
end
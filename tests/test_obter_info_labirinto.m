function ok = test_obter_info_labirinto()
  fprintf("Executando: test_obter_info_labirinto... ");

  % --- CENÁRIO MOCK (Grid 3x3) ---
  % Matriz com 6 caminhos livres (1) e 3 paredes (0)
  % Arestas válidas: 5
  matriz_blocos = [
                1, 1, 0;
                0, 1, 0;
                1, 1, 1
                ];

  n_blocos = 3;
  tamanho_bloco = 20;

  % Expande a matriz 3x3 para uma imagem de 60x60 pixels
  B = kron(matriz_blocos, ones(tamanho_bloco));

  % --- EXECUÇÃO ---
  [qtd_arestas, qtd_vertices] = obter_info_labirinto(B, n_blocos);

  % --- VALIDAÇÕES ---
  % 1. Quantidade de vértices (caminhos livres) esperada = 6
  t1 = (qtd_vertices == 6);

  % 2. Quantidade de arestas esperada = 5
  t2 = (qtd_arestas == 5);

  ok = (t1 && t2);

  if ok
    fprintf("[OK]\n");
  else
    fprintf("[FALHOU] Esperado (Arestas: 5, Vértices: 6), Obtido (Arestas: %d, Vértices: %d)\n", ...
      qtd_arestas, qtd_vertices);
  end
end

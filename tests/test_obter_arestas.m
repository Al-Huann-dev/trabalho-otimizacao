function ok = test_obter_arestas()
  fprintf("Executando: test_obter_arestas... ");

  n_celulas = 3;
  tamanho_bloco = 20;

  matriz_blocos = [
                1, 1, 0;
                0, 1, 0;
                1, 1, 1
                ];

  % Expande a matriz 3x3 para uma imagem de 60x60 pixels
  B = kron(matriz_blocos, ones(tamanho_bloco));

  [arestas, ~] = obter_arestas(B, n_celulas);

  % Validações:
  % 1. Total de arestas esperadas = 5
  t1 = (size(arestas, 1) == 5);

  % 2. Verificar se a aresta entre nó 1 e nó 2 existe
  t2 = any(arestas(:, 1) == 1 & arestas(:, 2) == 2);

  % 3. Verificar se a aresta vertical entre nó 2 e nó 5 existe
  t3 = any(arestas(:, 1) == 2 & arestas(:, 2) == 5);

  ok = (t1 && t2 && t3);

  if ok
    fprintf("[OK]\n");
  else
    fprintf("[FALHOU]\n");
  end
end

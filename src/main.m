% Partes 4 a 7: caminho minimo (Dijkstra) e visualizacao.
% Execute a partir da raiz do projeto (a pasta que contem "src").
1;
addpath("src");
<<<<<<< HEAD
pkg load image

n = 41;
arquivo = "labirinto_41x41.png";   % ajuste se o seu arquivo tiver outro nome

img = imread(arquivo);
B   = obter_imagem_labirinto_binaria(arquivo);

[arestas, qtd_arestas, vertices, qtd_vertices] = obter_grafo_labirinto(B, n);
[s, t, pos_s, pos_t] = obter_entrada_saida(B, n);

% ---------- Parte 4(a): vertices s e t ----------
printf("Entrada s = %d (linha %d, coluna %d)\n", s, pos_s(1), pos_s(2));
printf("Saida   t = %d (linha %d, coluna %d)\n", t, pos_t(1), pos_t(2));

% ---------- Parte 5: matriz de adjacencia (custo 1 por aresta) e Dijkstra ----------
N = n^2;
u = arestas(:, 1);
v = arestas(:, 2);
A = sparse([u; v], [v; u], 1, N, N);

tic;
[dist, anterior] = dijkstra(A, s);
tempo = toc;

% tempo medio em varias execucoes (uma unica medida e muito ruidosa)
reps = 20;
tic;
for r = 1:reps
  dijkstra(A, s);
end
tempo_medio = toc / reps;

% ---------- Parte 6: caminho minimo ----------
caminho = reconstruir_caminho(anterior, s, t);

if isempty(caminho)
  error("Nao existe caminho entre a entrada e a saida.");
endif

printf("\n--- Resultados ---\n");
printf("(a) Custo do caminho minimo:   %d\n", dist(t));
printf("(b) Movimentos realizados:     %d\n", numel(caminho) - 1);
printf("(c) Vertices no caminho:       %d\n", numel(caminho));
printf("(d) Tempo do Dijkstra:         %.4f s (1 execucao) | %.4f s (media de %d)\n", ...
       tempo, tempo_medio, reps);

% ---------- Parte 7: figuras ----------
% (a) labirinto original
figure; imshow(img); title("Labirinto original");
print("-dpng", "-r150", "labirinto_original.png");

% imagem binaria (item 4 da entrega)
figure; imshow(B); title("Imagem binaria (1 = livre, 0 = parede)");
print("-dpng", "-r150", "labirinto_binario.png");

% (b) grafo sobre o labirinto
figure; visualizar_grafo(img, arestas, vertices, s, t, n);
title("Grafo sobre o labirinto");
print("-dpng", "-r150", "grafo_sobre_labirinto.png");

% (c) apenas o caminho minimo
figure; visualizar_grafo(img, arestas, vertices, s, t, n, caminho, false);
title(sprintf("Caminho minimo (%d movimentos)", numel(caminho) - 1));
print("-dpng", "-r150", "caminho_minimo.png");

% (d) grafo completo com o caminho destacado
figure; visualizar_grafo(img, arestas, vertices, s, t, n, caminho, true);
title("Grafo completo com o caminho minimo destacado");
print("-dpng", "-r150", "grafo_e_caminho.png");
=======
n = 41;

% Parte 1 / item a), b)
B = carregar_imagem_binaria("labirinto.jpeg");

% Parte 1 / item d) - Exibindo a imagem 'cropada'.
imwrite(B, "labirinto_41x41.png");

% Parte 2 / item b) - Centro de cada nó

for i = 1:n
  for j = 1:n
    id = calcular_id_no(n, i, j);
    [x, y] = calcular_centro_celula(n, i, j);
    % fprintf("(Nó: %d; (x = %d, y = %d )", id, x, y);
  end
end

% Parte 2 / item c), d), e) e f)
[arestas, qtd_arestas, ~, qtd_vertices] = construir_grafo_labirinto(B, n);

% disp(arestas);
fprintf("Quantidade de arestas %d\n", qtd_arestas);
fprintf("Quantidade de vértices %d\n", qtd_vertices);

% Parte 5 - Dijkstra

N = n^2;
u = arestas(:, 1);
v = arestas(:, 2);

A = sparse([u ; v], [v ; u], 1, N, N);

s_coord = [2, 1];
t_coord = [40, 41];
s = calcular_id_no(n, s_coord(1), s_coord(2));
t = calcular_id_no(n, t_coord(1), t_coord(2));

tic;
[dist, anterior] = dijkstra(A, s);

tempo = toc;

fprintf("Tempo estimado de 1 execução: %.3f\n", tempo);

amostras = 20;
tic;
for r = 1:amostras
  dijkstra(A, s);
end

tempo_medio = toc / amostras;
fprintf("Tempo estimado de %d execuções: %d\n", amostras, tempo_medio);

caminho = reconstruir_caminho(anterior, s, t);

% Parte 6 \ itens a), b), c) e d)
fprintf("Custo do caminho mínimo: %d\n", dist(t));
fprintf("Movimentos realizados: %d\n", numel(caminho) - 1);
fprintf("Vertices no caminho: %d\n", numel(caminho));
fprintf("Tempo do Dijkstra(com min-heap): %.3f\n (1 execução) | %.4f s (media de %d)\n", tempo, tempo_medio, amostras);



>>>>>>> de26ab91b5949ed5a99c87ab1c60caa760d91083

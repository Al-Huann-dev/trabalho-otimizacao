1;

addpath("src");
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




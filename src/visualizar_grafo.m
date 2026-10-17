function visualizar_grafo(img, arestas, vertices, s, t, n_celulas, caminho, mostrar_grafo)
  if nargin < 7
    caminho = [];
  endif
  if nargin < 8 || isempty(mostrar_grafo)
    mostrar_grafo = true;
  endif
  n = n_celulas;

  % centro = (x = coluna, y = linha) de todas as celulas, indexado pelo id de cada nó
  x_c = zeros(n^2, 1);
  y_c = zeros(n^2, 1);
  for i = 1:n
    for j = 1:n
      id = calcular_id_no(n, i, j);
      [x_c(id), y_c(id)] = calcular_centro_celula(img, i, j, n);
    end
  end

  imshow(img);
  hold on;

  % desenha todas as arestas em uma única chamada utlizando a estratégia dos 'NaNs'
  if mostrar_grafo
    u = arestas(:, 1);
    v = arestas(:, 2);
    X = [x_c(u)'; x_c(v)'; NaN(1, numel(u))];
    Y = [y_c(u)'; y_c(v)'; NaN(1, numel(u))];
    plot(X(:), Y(:), "-", "Color", [0.90 0.50 0.00], "LineWidth", 1);

  % plota os vértices
  plot(x_c(vertices), y_c(vertices), "o", "MarkerSize", 3, ...
        "MarkerFaceColor", [0.25 0.25 0.25], "MarkerEdgeColor", "none");
  endif

  if ~isempty(caminho)
    plot(x_c(caminho), y_c(caminho), "-", "Color", [0.85 0.00 0.00], "LineWidth", 2.5);
  endif

  % entrada com cor verde e saída com cor azul, como sugerido na atividade
  plot(x_c(s), y_c(s), "s", "MarkerSize", 5, "MarkerFaceColor", [0.00 0.65 0.00], "MarkerEdgeColor", "k");
  plot(x_c(t), y_c(t), "s", "MarkerSize", 5, "MarkerFaceColor", [0.00 0.20 0.90], "MarkerEdgeColor", "k");

  hold off;
end
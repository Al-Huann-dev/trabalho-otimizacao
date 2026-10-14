function [n_vertices, n_arestas] = function obter_info_labirinto() 
  [n_vertices, _] = obter_grafo_labirinto()

  n_arestas = size(criar_arestas(B))
end
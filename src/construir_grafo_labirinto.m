function [arestas, qtd_arestas, vertices, qtd_vertices] = construir_grafo_labirinto(B, n_celulas) 
  if nargin < 2 || isempty(n_celulas)
    n_celulas = 41;
  endif

  [arestas, qtd_arestas] = obter_arestas(B, n_celulas);
  [vertices, qtd_vertices, ~, ~] = extrair_caminhos_e_paredes(B, n_celulas);
end
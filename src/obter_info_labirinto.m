function [qtd_arestas, qtd_vertices] = obter_info_labirinto(B, n_celulas) 
  if nargin < 2 || isempty(n_celulas)
    n_celulas = 41;
  endif

  [~, qtd_arestas] = obter_arestas(B, n_celulas);
  [~, qtd_vertices, ~, ~] = obter_info_caminhos_paredes(B, n_celulas);
end
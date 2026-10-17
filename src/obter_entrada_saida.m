function [s, t, pos_s, pos_t] = obter_entrada_saida(B, n_celulas)
  if nargin < 2 || isempty(n_celulas)
    n_celulas = 41;
  endif

  n = n_celulas;
  [livres, ~, ~, ~] = obter_info_caminhos_paredes(B, n);

  i = ceil(livres / n);
  j = livres - (i - 1) * n;

  na_borda = (i == 1) | (i == n) | (j == 1) | (j == n);
  ids_borda = livres(na_borda);

  if numel(ids_borda) ~= 2
    error("Esperava 2 celulas livres na borda (entrada e saida), encontrei %d.", numel(ids_borda));
  endif

  s = ids_borda(1);   % menor id: entrada
  t = ids_borda(2);   % maior id: saida

  pos_s = [ceil(s / n), s - (ceil(s / n) - 1) * n];   % [linha, coluna]
  pos_t = [ceil(t / n), t - (ceil(t / n) - 1) * n];
end
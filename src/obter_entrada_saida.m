function [s, t, pos_s, pos_t] = obter_entrada_saida(B, n_celulas)
  if nargin < 2 || isempty(n_celulas)
    n_celulas = 41;
  endif

  n = n_celulas;
  [livres, ~, ~, ~] = extrair_caminhos_e_paredes(B, n);

  i = ceil(livres / n);
  j = livres - (i - 1) * n;

  na_borda = (i == 1) | (i == n) | (j == 1) | (j == n);
  ids_borda = livres(na_borda);

  if numel(ids_borda) ~= 2
    error("Esperava-se 2 celulas livres na borda (entrada e saida). Encontrado %d.", numel(ids_borda));
  endif

  s = ids_borda(1);
  t = ids_borda(2);

  pos_s = [ceil(s / n), s - (ceil(s / n) - 1) * n];
  pos_t = [ceil(t / n), t - (ceil(t / n) - 1) * n];
end
function [caminhos_livres, qtd_caminhos, paredes, qtd_paredes] = obter_info_caminhos_paredes(B, n_celulas)
  if nargin < 2 || isempty(n_celulas)
    n_celulas = 41;
  endif

  n = n_celulas

  caminhos_livres = zeros(n^2, 1);
  qtd_caminhos = 0;
  paredes = zeros(n^2, 1);
  qtd_paredes = 0;

  for i = 1:n
    for j = 1:n
      id_no = obter_id_no(n, i, j);
      [x, y] = obter_centro_celula(B, i, j, n);
      valor = B(y, x);

      if valor == 1
        qtd_caminhos = qtd_caminhos + 1;
        caminhos_livres(qtd_caminhos) = id_no;
      else
        qtd_paredes = qtd_paredes + 1;
        paredes(qtd_paredes) = id_no;
      endif
    end
  end
end

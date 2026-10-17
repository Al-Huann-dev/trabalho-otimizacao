function [caminhos_livres, qtd_caminhos, paredes, qtd_paredes] = extrair_caminhos_e_paredes(B, n_celulas)
  if nargin < 2 || isempty(n_celulas)
    n_celulas = 41;
  endif

  n = n_celulas;

  caminhos_livres_temp = zeros(n^2, 1);
  qtd_caminhos = 0;
  paredes_temp = zeros(n^2, 1);
  qtd_paredes = 0;

  for i = 1:n
    for j = 1:n
      id_no = calcular_id_no(n, i, j);
      [x, y] = calcular_centro_celula(B, i, j, n);
      valor = B(y, x);

      if valor == 1
        qtd_caminhos = qtd_caminhos + 1;
        caminhos_livres_temp(qtd_caminhos) = id_no;
      else
        qtd_paredes = qtd_paredes + 1;
        paredes_temp(qtd_paredes) = id_no;
      endif
    end
  end

  caminhos_livres = caminhos_livres_temp(1:qtd_caminhos);
  paredes = paredes_temp(1:qtd_paredes);
end

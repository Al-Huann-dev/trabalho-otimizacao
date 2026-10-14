function [caminhos_livres, qtd_caminhos, paredes, qtd_paredes] = criar_grafo_labirinto(caminho_arquivo = "maze_matrix.txt")
  if nargin == 0 || isempty(caminho_arquivo)
    caminho_arquivo = "matriz_labirinto_mock.txt"
  end

  matriz_labirinto = load(caminho_arquivo).matriz_41x41;
  [n_linhas, n_colunas] = size(matriz_labirinto);

  n = n_linhas;

  caminhos_livres = [];
  qtd_caminhos = 0;
  paredes = [];
  qtd_paredes = 0;

  for i = 1:n_linhas
    for j = 1:n_colunas
      id_no = criar_id_no(n, i, j);
      valor = matriz_labirinto(i, j);

      if valor == 1
        caminhos_livres(end + 1) = id_no;
        qtd_caminhos = qtd_caminhos + 1;
      else
        paredes(end + 1) = id_no;
        qtd_paredes = qtd_paredes + 1;
      end
    end
  end
end

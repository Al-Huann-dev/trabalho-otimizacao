
function [caminhos_livres, paredes] = criar_grafo_labirinto(caminho_arquivo = "maze_matrix.txt")
  matriz_labirinto = load("matriz_labirinto_mock.txt").matriz_41x41;

  [n_linhas, n_colunas] = size(matriz_labirinto);
  disp(n_linhas);
  disp(n_colunas);

  n = n_linhas;

  caminhos_livres = [];
  contador_caminhos_livres = 0;
  paredes = [];
  contador_paredes = 0;

  for i = 1:n_linhas
    for j = 1:n_colunas
      id_no = criar_id_no(n,i,j);
      valor = matriz_labirinto(i, j);

      if valor == 1
        caminhos_livres(end + 1) = id_no;
        contador_caminhos_livres = contador_caminhos_livres + 1;
      end
      
      paredes(end + 1) = id_no;
      contador_paredes = contador_paredes + 1;
    end
  end

  fprintf("Linhas: %d, Colunas: %d\n", n_linhas, n_colunas);
  fprintf("Caminhos livres: %d\n", contador_caminhos_livres);
  fprintf("Paredes: %d\n", contador_paredes);

end
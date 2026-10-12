function B = obter_matriz_labirinto(caminho_arquivo)
  if nargin == 0;
    caminho_arquivo = "matriz_labirinto_mock.txt";
  end
  
  B = load(caminho_arquivo).matriz_41x41;
end
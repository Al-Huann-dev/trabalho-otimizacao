function B = carregar_imagem_binaria(caminho_arquivo)
  pkg load image

  if nargin < 1 || isempty(caminho_arquivo)
    caminho_arquivo = "labirinto.jpeg";
  endif

  img = imread(caminho_arquivo);

  if size(img, 3) == 3
    img = rgb2gray(img);
  endif

  limiar = 128;

  B_temp = img > limiar;

  [linhas_pretas, colunas_pretas] = find(B_temp == 0);

  y_min = min(linhas_pretas);
  x_min = min(colunas_pretas);
  y_max = max(linhas_pretas);
  x_max = max(colunas_pretas);

  B = B_temp(y_min:y_max, x_min:x_max);

  imwrite(B, "labirinto_41x41.png");
end

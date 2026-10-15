function B = obter_imagem_labirinto_binaria(caminho_arquivo)
  pkg load image

  if nargin < 1 || isempty(caminho_arquivo)
    caminho_arquivo = "labirinto_41x41.png";
  endif

  img = imread(caminho_arquivo);

  if size(img, 3) == 3
    img = rgb2gray(img);
  endif

  limiar = 128;

  B = img > limiar;
end
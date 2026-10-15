
pkg load image

B = function obter_imagem_labirinto_binaria(caminho_arquivo)
  if nargin < 2 
  || isempty(caminho_arquivo)
  || isempty(n_blocos)
    caminho_arquivo = "labirinto_41x41.png";
  endif

  if size(img, 3) == 3
    img = rgb2gray(img);
  endif

  limiar = 128;

  B = img > limiar;
end

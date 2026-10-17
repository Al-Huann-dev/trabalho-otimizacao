function caminho = reconstruir_caminho(anterior, s, t)
  caminho = t;
  v = t;

  while v ~= s
    v = anterior(v);
    if v == 0
      caminho = [];
      return;
    endif
    caminho(end + 1) = v;
  endwhile

  caminho = fliplr(caminho);
end
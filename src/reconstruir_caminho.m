function caminho = reconstruir_caminho(anterior, s, t)
  caminho = [];
  v = t;

  while v ~= 0
    caminho = [v, caminho];

    if v == s
      break;
    endif

    v = anterior(v);
  endwhile

  if isempty(caminho) || caminho(1) ~= s
    caminho = [];
  endif
end

function [dist, anterior] = dijkstra(A, s)
  N = size(A, 1);

  dist = Inf(N, 1);
  anterior = zeros(N, 1);

  dist(s) = 0;

  heap_distancias = zeros(N * 4, 2);
  heap_tamanho = 0;

  [heap_distancias, heap_tamanho] = heap_push(heap_distancias, heap_tamanho, 0, s);

  while heap_tamanho > 0
    [heap_distancias, heap_tamanho, d_u, u] = heap_pop(heap_distancias, heap_tamanho);

    if d_u > dist(u)
      continue;
    endif

    vizinhos = find(A(u, :));
    for v = vizinhos
      peso = A(u, v);
      nova_dist = dist(u) + peso;

      if nova_dist < dist(v)
        dist(v) = nova_dist;
        anterior(v) = u;

        [heap_distancias, heap_tamanho] = heap_push(heap_distancias, heap_tamanho, nova_dist, v);
      endif
    endfor
  endwhile
end

function [heap, sz] = heap_push(heap, sz, d, u)
  sz = sz + 1;
  heap(sz, :) = [d, u];
  i = sz;
  
  while i > 1
    p = floor(i / 2);
    if heap(i, 1) < heap(p, 1)
      tmp = heap(i, :);
      heap(i, :) = heap(p, :);
      heap(p, :) = tmp;
      i = p;
    else
      break;
    endif
  endwhile
end

function [heap, sz, d, u] = heap_pop(heap, sz)
  d = heap(1, 1);
  u = heap(1, 2);
  heap(1, :) = heap(sz, :);
  sz = sz - 1;

  i = 1;

  while true
    esq = 2 * i;
    dir = 2 * i + 1;
    menor = i;

    if esq <= sz && heap(esq, 1) < heap(menor, 1)
      menor = esq;
    endif
    if dir <= sz && heap(dir, 1) < heap(menor, 1)
      menor = dir;
    endif

    if menor ~= i
      tmp = heap(i, :);
      heap(i, :) = heap(menor, :);
      heap(menor, :) = tmp;
      i = menor;
    else
      break;
    endif
  endwhile
end

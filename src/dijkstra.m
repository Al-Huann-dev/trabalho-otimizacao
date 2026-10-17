function [dist, anterior] = dijkstra(A, s)
  N = size(A, 1);

  dist     = Inf(N, 1);
  anterior = zeros(N, 1);
  visitado = false(N, 1);

  dist(s) = 0;

  for k = 1:N
    % vertice nao visitado de menor distancia
    d = dist;
    d(visitado) = Inf;
    [d_min, u] = min(d);

    if isinf(d_min)
      break;                 % o que resta e inalcancavel
    endif

    visitado(u) = true;

    % relaxa as arestas que saem de u
    vizinhos = find(A(u, :));
    for v = vizinhos
      if ~visitado(v)
        nova_dist = dist(u) + A(u, v);
        if nova_dist < dist(v)
          dist(v) = nova_dist;
          anterior(v) = u;
        endif
      endif
    end
  end
end
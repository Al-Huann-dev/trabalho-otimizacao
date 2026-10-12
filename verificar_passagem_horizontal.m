function existe = verificar_passagem_arestas(B, i, j1, j2)
    existe = (B(i, j1) == 1 && B(i, j2) == 1);
end

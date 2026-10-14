function existe = verificar_passagem_vertical(B, i1, i2, j)
    existe = (B(i1, j) == 1 && B(i2, j) == 1);
end

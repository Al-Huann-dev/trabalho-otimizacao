function existe = verificar_passagem_vertical(B, j, i1, i2)
    existe = (B(i1, j) == 1 && B(i2, j) == 1);
end

function ok = test_verificar_passagem_vertical()
  fprintf("Executando: test_verificar_passagem_vertical... ");

  B = [
    1, 1, 0;
    0, 1, 1;
    1, 1, 1
    ];

  % Caminho entre (1,2) e (2,2) -> Ambos são 1 (Linha 1, Coluna 2 <-> Linha 2, Coluna 2)
  t1 = (verificar_passagem_vertical(B, 1, 2, 2, 3) == true);

  % Parede entre (1,1) e (2,1) -> (2,1) é 0 (Linha 1, Coluna 1 <-> Linha 2, Coluna 1)
  t2 = (verificar_passagem_vertical(B, 1, 2, 1, 3) == false);

  ok = (t2);

  if ok
    fprintf("[OK]\n");
  else
    fprintf("[FALHOU]\n");
  end
end

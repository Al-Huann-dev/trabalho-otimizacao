function ok = test_verificar_passagem_horizontal()
  fprintf("Executando: test_verificar_passagem_horizontal... ");

  B = [
    1, 1, 0;
    0, 1, 1;
    1, 1, 1
    ];

  % Caminho entre (1,1) e (1,2) -> Ambos são 1
  t1 = (verificar_passagem_horizontal(B, 1, 1, 2, 3) == true);

  % Parede entre (1,2) e (1,3) -> (1,3) é 0
  t2 = (verificar_passagem_horizontal(B, 1, 2, 3, 3) == false);

  ok = (t1 && t2);

  if ok
    fprintf("[OK]\n");
  else
    fprintf("[FALHOU]\n");
  end
end

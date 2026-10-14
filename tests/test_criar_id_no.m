function ok = teste_criar_id_no()
  fprintf("Executando test_criar_id_no...");

  t1 = (criar_id_no(3, 2, 2) == 5);

  ok = t1;

  if ok
    fprintf("[OK]\n");
  else
    fprintf("[FALHOU]\n");
  end
end

function ok = teste_calcular_id_no()
  fprintf("Executando: test_calcular_id_no...");

  t1 = (calcular_id_no(3, 2, 2) == 5);

  ok = t1;

  if ok
    fprintf("[OK]\n");
  else
    fprintf("[FALHOU]\n");
  end
end

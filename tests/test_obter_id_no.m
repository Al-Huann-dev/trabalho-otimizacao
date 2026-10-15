function ok = teste_obter_id_no()
  fprintf("Executando: test_obter_id_no...");

  t1 = (obter_id_no(3, 2, 2) == 5);

  ok = t1;

  if ok
    fprintf("[OK]\n");
  else
    fprintf("[FALHOU]\n");
  end
end

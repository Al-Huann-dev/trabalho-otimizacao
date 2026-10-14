1; % Permite subfunções / scripts encadeados

% Adiciona a pasta src ao path para que os testes encontrem as funções
addpath("../src");

fprintf("\n=========================================\n");
fprintf("      EXECUÇÃO DA SUÍTE DE TESTES        \n");
fprintf("=========================================\n\n");

sucessos = 0;
total = 1;

sucessos = sucessos + test_criar_id_no();

fprintf("\n=========================================\n");
fprintf(" RESULTADO: %d/%d módulos de teste passaram.\n", sucessos, total);
fprintf("=========================================\n\n");
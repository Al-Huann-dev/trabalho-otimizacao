1; % Permite subfunções / scripts encadeados

diretorio_atual = fileparts(mfilename('fullpath'));

addpath(diretorio_atual);
addpath(diretorio_atual, "..", "src");

fprintf("\n=========================================\n");
fprintf("      EXECUÇÃO DA SUÍTE DE TESTES        \n");
fprintf("=========================================\n\n");

sucessos = 0;
total = 6;

sucessos = sucessos + test_calcular_id_no();
sucessos = sucessos + test_verificar_passagem_horizontal();
sucessos = sucessos + test_verificar_passagem_vertical();
sucessos = sucessos + test_obter_arestas();
sucessos = sucessos + test_construir_grafo_labirinto();
sucessos = sucessos + test_extrair_caminhos_e_paredes()

fprintf("\n=========================================\n");
fprintf(" RESULTADO: %d/%d módulos de teste passaram.\n", sucessos, total);
fprintf("=========================================\n\n");
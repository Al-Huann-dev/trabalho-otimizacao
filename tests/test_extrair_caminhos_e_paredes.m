function ok = test_extrair_caminhos_e_paredes()
    fprintf("Executando: test_extrair_caminhos_e_paredes... ");

    % --- CENÁRIO MOCK (Grid 3x3) ---
    % Matriz com:
    % 6 caminhos livres (1) -> IDs: 1, 2, 5, 7, 8, 9
    % 3 paredes (0)         -> IDs: 3, 4, 6
    matriz_blocos = [
        1, 1, 0;
        0, 1, 0;
        1, 1, 1
    ];

    n_celulas = 3;
    tamanho_bloco = 20;

    % Expande para uma imagem mock de 60x60 pixels
    B = kron(matriz_blocos, ones(tamanho_bloco));

    % --- EXECUÇÃO ---
    [caminhos_livres, qtd_caminhos, paredes, qtd_paredes] = extrair_caminhos_e_paredes(B, n_celulas);

    % --- VALIDAÇÕES ---
    % 1. Quantidade de caminhos livres esperada = 6
    t1 = (qtd_caminhos == 6);

    % 2. Quantidade de paredes esperada = 3
    t2 = (qtd_paredes == 3);

    % 3. Verificar se os IDs dos caminhos contêm o ID 1 e ID 9
    t3 = any(caminhos_livres == 1) && any(caminhos_livres == 9);

    % 4. Verificar se a lista de paredes contém o ID 3 e ID 4
    t4 = any(paredes == 3) && any(paredes == 4);

    ok = (t1 && t2 && t3 && t4);

    if ok
        fprintf("[OK]\n");
    else
        fprintf("[FALHOU]\n");
    end
end
% ==============================================================================
% GUIA RÁPIDO DE OCTAVE PARA QUEM JÁ CONHECE PYTHON
% Para rodar: execute este arquivo no VS Code ou digite "tutorial_octave"
% ==============================================================================

clear; clc; % limpa o workspace e a tela (Em Python: import gc; gc.collect() / os.system('cls'))


%% 1. EXIBIÇÃO NA TELA (PRINT)
% ------------------------------------------------------------------------------
% Em Python: print("Olá Mundo")
% No Octave: Usamos disp() para texto simples ou fprintf() para texto formatado.
% NOTA: No Octave, textos são entre aspas simples '...' ou duplas "...".
% Se você esquecer o ponto e vírgula (;) no final da linha, o Octave imprime o resultado!

disp('--- 1. Exibição na Tela ---');
disp('Olá, Mundo!');

nome = 'Maria';
idade = 25;
fprintf('Nome: %s | Idade: %d\n', nome, idade); % Funciona igual ao print(f"...") do Python


%% 2. TIPOS DE DADOS E ESTRUTURAS BÁSICAS
% ------------------------------------------------------------------------------
% Em Python: x = 10 (int/float) | texto = "Olá" (str) | lista = [1, 2, 3]
% No Octave: TUDO por padrão é uma Matriz/Vetor numérico de ponto flutuante (double).

disp(' ');
disp('--- 2. Variáveis e Coleções ---');

a = 10;                     % Escalar (Matriz 1x1)
vetor_linha = [1, 2, 3, 4]; % Em Python: lista = [1, 2, 3, 4] ou np.array([1, 2, 3, 4])
vetor_coluna = [1; 2; 3; 4];% Separação com ponto e vírgula (;) muda a linha
matriz = [1, 2; 3, 4];      % Em Python (NumPy): np.array([[1, 2], [3, 4]])

% Cell Arrays (Análogo às Listas heterogêneas do Python):
% Permitem guardar diferentes tipos de dados na mesma estrutura.
minha_lista = {'Texto', 42, [1, 2, 3]}; % Usa chaves {}


%% 3. INDEXAÇÃO (MUITO IMPORTANTE!)
% ------------------------------------------------------------------------------
% ATENÇÃO: No Python a indexação começa em 0. No Octave começa em 1!
% Em Python: lista[0]
% No Octave: vetor(1)

disp(' ');
disp('--- 3. Indexação (Início em 1!) ---');

v = [10, 20, 30, 40, 50];
primeiro = v(1);    % Retorna 10 (Em Python: v[0])
ultimo   = v(end);  % Retorna 50 (Em Python: v[-1])
fatia    = v(2:4);  % Retorna [20, 30, 40] (Em Python: v[1:4])

disp('Fatfatia do vetor (2 a 4):');
disp(fatia);


%% 4. OPERAÇÕES MATRICIAIS E ELEMENTO A ELEMENTO
% ------------------------------------------------------------------------------
% Em Python com NumPy: A * B faz multiplicação elemento a elemento, e A @ B faz multiplicação matricial.
% No Octave é o CONTRÁRIO:
%   * e ^   = Operações Matriciais de Álgebra Linear.
%  .* e .^  = Operações Elemento a Elemento (com um ponto na frente!).

disp(' ');
disp('--- 4. Operações de Álgebra Linear vs Elemento a Elemento ---');

A = [1, 2; 3, 4];
B = [2, 0; 1, 2];

mult_matricial = A * B;   % Multiplicação de matrizes (Álgebra Linear)
mult_elemento  = A .* B;  % Multiplica posição por posição (1*2, 2*0, 3*1, 4*2)

disp('Multiplicação de Matrizes (A * B):');
disp(mult_matricial);

disp('Multiplicação Elemento a Elemento (A .* B):');
disp(mult_elemento);


%% 5. ESTRUTURAS DE CONTROLE (IF, FOR, WHILE)
% ------------------------------------------------------------------------------
% Em Python: usa indentação e 'elif'.
% No Octave: usa palavras-chave explicitando o 'end', e 'elseif'.

disp(' ');
disp('--- 5. Condicionais e Laços ---');

% If / Else
nota = 8;
if nota >= 7
    disp('Aprovado!');
elseif nota >= 5
    disp('Recuperação');
else
    disp('Reprovado');
end

% For Loop (Em Python: for i in range(1, 6):)
disp('Contagem com For:');
for i = 1:5
    fprintf('Passo %d\n', i);
end


%% 6. UTILITÁRIOS PARA OTIMIZAÇÃO LINEAR
% ------------------------------------------------------------------------------
% Funções nativas do Octave muito usadas para construir problemas de otimização
% (criar vetores restritivos, matrizes de coeficientes, etc.)

disp(' ');
disp('--- 6. Comandos Úteis para Otimização ---');

vetor_zeros = zeros(1, 4);   % [0, 0, 0, 0] -> Em Python: np.zeros(4)
matriz_um    = ones(2, 3);    % Matriz 2x3 de 1s -> Em Python: np.ones((2,3))
matriz_id    = eye(3);        % Matriz Identidade 3x3 -> Em Python: np.eye(3)
tamanho      = size(A);       % Retorna dimensões [linhas, colunas] (Em Python: A.shape)
transposta   = A';            % Transposta da matriz A (Em Python: A.T)

disp('Matriz Identidade 3x3 (eye(3)):');
disp(matriz_id);


%% 7. COMO DEFINIR UMA FUNÇÃO
% ------------------------------------------------------------------------------
% Em Python:
%   def somar(x, y):
%       return x + y
% No Octave:
%   function resultado = somar(x, y)
%       resultado = x + y;
%   end

disp(' ');
disp('--- 7. Exemplo de Função Local ---');

% Testando a função definida abaixo no final do arquivo:
res = somar_valores(15, 25);
fprintf('Resultado da função somar_valores(15, 25): %d\n', res);


% ==============================================================================
% DEFINIÇÕES DE FUNÇÕES LOCAIS (Sempre ficam no final do arquivo no Octave)
% ==============================================================================
function total = somar_valores(a, b)
    total = a + b;
end
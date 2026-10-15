# 🧪 Suíte de Testes Unitários — Grafo do Labirinto

Este diretório contém a estrutura de testes unitários automatizados para o projeto de representação em grafo do labirinto ($41 \times 41$). O objetivo é garantir a integridade dos métodos do módulo `src/` e prevenir *regressões* durante a refatoração do código.

---

## 📁 Estrutura de Arquivos

```text
tests/
├── README.md                            # Guia de utilização (este arquivo)
├── rodar_todos_testes.m                # Executador (Runner) principal da suíte
├── test_criar_id_no.m                  # Valida conversão (i, j) -> ID linear
├── test_verificar_passagem_horizontal.m # Valida conexões na horizontal
├── test_verificar_passagem_vertical.m   # Valida conexões na vertical
├── test_criar_grafo_labirinto.m        # Valida contagem de caminhos/paredes
└── test_criar_arestas.m                # Valida construção final das arestas
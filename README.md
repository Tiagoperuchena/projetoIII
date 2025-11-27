# projetoIII
Utilização de programação Shell Script para automação de tarefas e uso do ambiente Gnuplot para geração de gráficos automatizados.

# 📊 Benchmarking de Algoritmos de Ordenação (C vs Python)

Este repositório contém scripts e códigos-fonte para realizar um **benchmarking de desempenho** de algoritmos de ordenação clássicos (**MergeSort** e **SelectionSort**) implementados em **C** e **Python**.

O objetivo é comparar o **tempo médio de execução** (complexidade temporal) dessas implementações com diferentes tamanhos de entrada ($N$) e visualizar os resultados usando **Gnuplot**.

## 🛠️ Tecnologias Utilizadas

* **Linguagens:** C e Python
* **Scripts de Automação:** Bash (`testes.sh` e `script.sh`)
* **Plotagem de Gráficos:** Gnuplot
* **Cálculos:** `bc` (para aritmética de ponto flutuante nos scripts Bash)

## 📁 Estrutura do Projeto

* `src/`: Implementações dos algoritmos de ordenação em C e Python.
* `scripts/`: Scripts Bash para compilação, execução dos testes e coleta de dados.
* `plot/`: Scripts do Gnuplot para a geração dos gráficos de comparação.
* `data/`: Diretório para os arquivos CSV gerados com os tempos de execução. (Ignorado pelo Git)
* `results/`: Diretório para os gráficos PNG gerados. (Ignorado pelo Git)

## 🏃 Como Executar os Testes

**Pré-requisitos:**
1.  Compilador C (`gcc` ou similar).
2.  Interpretador Python 3.
3.  `gnuplot` instalado.
4.  `bc` (calculadora de precisão arbitrária) instalado.

1.  **Navegue até o diretório `scripts`:**
    ```bash
    cd scripts
    ```
2.  **Execute o script principal:**
    ```bash
    ./script.sh
    ```

Este script irá iterar sobre diferentes tamanhos de entrada ($N$) e linguagens, executar cada algoritmo **10 vezes** (`$NUM_EXECUCOES=10`) para coletar dados, e, por fim, gerar os gráficos de comparação na pasta `results/`.

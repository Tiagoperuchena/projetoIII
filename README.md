# projetoIII
Utilização de programação Shell Script para automação de tarefas e uso do ambiente Gnuplot para geração de gráficos automatizados.

# 📊 Análise de Desempenho de Algoritmos de Ordenação em C e Python Utilizando Shell Script e Gnuplot

Este repositório contém scripts e códigos-fonte para realizar um **benchmarking de desempenho** de algoritmos de ordenação clássicos (**MergeSort** e **SelectionSort**) implementados em **C** e **Python**.

O objetivo é comparar o **tempo médio de execução** (complexidade temporal) dessas implementações com diferentes tamanhos de entrada ($N$) e visualizar os resultados usando **Gnuplot**.

## 🛠️ Tecnologias Utilizadas

* **Linguagens:** C e Python
* **Scripts de Automação:** Bash (`testes.sh` - principal orquestrador, e `script.sh` - executa os testes de um algoritmo/linguagem específico)
* **Plotagem de Gráficos:** Gnuplot
* **Cálculos:** `bc` (para aritmética de ponto flutuante nos scripts Bash)

## 📁 Estrutura do Projeto

* `src/`: Implementações dos algoritmos de ordenação em C (`mergesort-casos.c`, `selectionSort.c`) e Python (`mergesort-casos.py`, `selectionsort-casos.py`).
* `scripts/`: Scripts Bash para execução dos testes.
    * `testes.sh`: **Script principal** que itera sobre todos os algoritmos, linguagens e tamanhos de entrada.
    * `script.sh`: Script auxiliar para rodar e calcular o tempo de um único teste, gerando os arquivos CSV.
* `plot/`: Scripts do Gnuplot (`.plot`) para a geração dos gráficos de comparação.
* `data/`: Diretório para os arquivos CSV gerados com os tempos de execução. (Geralmente ignorado pelo Git)
* `results/`: Diretório para os gráficos PNG gerados. (Geralmente ignorado pelo Git)

## 🏃 Como Executar os Testes

O script principal que orquestra todo o processo de *benchmarking* é o `testes.sh`.

**Pré-requisitos:**
1.  Compilador C (`gcc` ou similar).
2.  Interpretador Python 3.
3.  `gnuplot` instalado.
4.  `bc` (calculadora de precisão arbitrária) instalado.

1.  **Navegue até o diretório `scripts`:**
    ```bash
    cd scripts
    ```
2.  **Execute o script principal (`testes.sh`):**
    ```bash
    ./testes.sh
    ```

Este script irá:
* Iterar sobre os tamanhos de entrada ($N$) definidos (`10, 100, 1000, 10000, 100000`).
* Executar cada algoritmo em cada linguagem (`C` e `Python`) **10 vezes** (`$NUM_EXECUCOES=10`).
* Gerar os arquivos de log (`.csv`) com os tempos individuais e as médias na pasta `data/`.
* Por fim, executar os scripts `.plot` do Gnuplot para gerar os gráficos de comparação na pasta `results/`.

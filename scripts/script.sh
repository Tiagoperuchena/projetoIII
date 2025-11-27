#!/bin/bash

linguagem=""
algoritmo=""
execucoes=10
tamanho=(10 100 1000 10000 100000)
caso=3

while getopts "l:a:n:t:c:" opt; do
    case "$opt" in

        l) linguagem=$OPTARG ;;
        a) algoritmo=$OPTARG ;;
        n) execucoes=$OPTARG ;;
        t) tamanho=$OPTARG ;;
        c) caso=$OPTARG ;;

    esac
done

echo -e "\n"
echo "  Algoritmo: $algoritmo"
echo "  Linguagem: $linguagem"
echo "  Tamanho: $tamanho"
echo "  Repetições: $execucoes"
echo "  Caso: $caso (aleatório)"
echo -e "\n"

LOG_FILE="log_${algoritmo}_${linguagem}_N${tamanho}_n${execucoes}_media.csv"
TEMPOS_FILE="log_${algoritmo}_${linguagem}_N${tamanho}_n${execucoes}_tempos.csv"

rm -f "$LOG_FILE" "$TEMPOS_FILE"
echo "Tamanho;TempoMedio" > "$LOG_FILE"

CABECALHO_TEMPOS="Tamanho"
for (( j=1; j<=$execucoes; j++ )); do
    CABECALHO_TEMPOS="$CABECALHO_TEMPOS;Tempo_$j"
done
echo "$CABECALHO_TEMPOS" >> "$TEMPOS_FILE"

LINHA_TEMPOS="$tamanho"
TEMPO_TOTAL=0

for (( i=1; i<=$execucoes; i++ )); do

    if [ "$linguagem" == "c" ]; then
        programa="./${algoritmo}_c"
        saida=$($programa $tamanho $caso)
    elif [ "$linguagem" == "python" ]; then
        programa="python3 ${algoritmo}-casos.py"
        saida=$($programa $tamanho $caso)
    fi

    tempo=$(echo $saida | cut -d ';' -f 2)
    
    LINHA_TEMPOS="$LINHA_TEMPOS;$tempo"
    TEMPO_TOTAL=$(echo "scale=10; $TEMPO_TOTAL + $tempo" | bc)
    
    echo " Tempo $i/$execucoes: $tempo segundos"
done

echo -e "\n"

echo "$LINHA_TEMPOS" >> "$TEMPOS_FILE"

TEMPO_MEDIO=$(echo "scale=10; $TEMPO_TOTAL / $execucoes" | bc)

echo "$tamanho;$TEMPO_MEDIO" >> "$LOG_FILE"

echo "Média para N=$tamanho, n=$execucoes: $TEMPO_MEDIO segundos"
echo -e "\n"
echo "Dados salvos em:"
echo "Média: $LOG_FILE"
echo "Tempos Individuais: $TEMPOS_FILE"
echo -e "\n"


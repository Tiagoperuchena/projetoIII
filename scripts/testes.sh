#!/bin/bash


# Lista de tamanhos de entrada (N) a serem testados
TAMANHOS_N=(10 100 1000 10000 100000)

NUM_EXECUCOES=10 


ALGORITMOS=("merge" "selection")
LINGUAGENS=("c" "python")
RODAR_SCRIPT="./script.sh"


echo "Tamanhos de N a testar: ${TAMANHOS_N[*]}"
echo "Repetições (n) por teste: $NUM_EXECUCOES"



for N in "${TAMANHOS_N[@]}"; do
    echo ">>>> COLETANDO DADOS PARA N = $N <<<<"
 
    for ALG in "${ALGORITMOS[@]}"; do
       
        for LING in "${LINGUAGENS[@]}"; do
            
            echo "Executando: $ALG em $LING..."
            
           
            $RODAR_SCRIPT -l $LING -a $ALG -n $NUM_EXECUCOES -t $N
            
            sleep 1 
            
        done 
    done
done


echo "  Arquivos CSV gerados \n"




echo " GERANDO GRÁFICOS COM GNUPLOT "
gnuplot comparacao_aleatorio_preto.plot

echo "-------------------------------------------------"
echo "GRÁFICOS GERADOS COM SUCESSO."
echo "Teste finalizado."

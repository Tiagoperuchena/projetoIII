set terminal pngcairo size 1000,700 font "Arial,12" 

set datafile separator ";"
set border lc rgb "black" 
set tics textcolor rgb "black"
set xlabel "Entradas" textcolor rgb "black"
set ylabel "Tempo médio (s)" textcolor rgb "black"
set title textcolor rgb "black"
set key outside textcolor rgb "black"
set grid lw 1 lc rgb "gray"

set xrange [10:100000]
set yrange [0.000001:1000]
set logscale xy
set format y "%.7f" 

set output "comparacao_mergesort_medias.png"
set title "Comparação das Médias — MergeSort (C vs Python)"

plot \
    "<cat log_merge_c_*_media.csv | sort -n" u 1:2 w lp lw 2 pt 7 lc rgb "green" t "C", \
    "<cat log_merge_c_*_media.csv | sort -n" u 1:2: \
        (sprintf("E: %g, T: %.8f", $1, $2)) \
        with labels offset char 2 font "Arial,8" notitle lc rgb "green", \
    "<cat log_merge_python_*_media.csv | sort -n" u 1:2 w lp lw 2 pt 7 lc rgb "blue"  t "Python", \
    "<cat log_merge_python_*_media.csv | sort -n" u 1:2: \
        (sprintf("E: %g, T: %.8f", $1, $2)) \
        with labels offset char 2 font "Arial,8" notitle lc rgb "blue"

set output "comparacao_selectionsort_medias.png"
set title "Comparação das Médias — SelectionSort (C vs Python)"

plot \
    "<cat log_selection_c_*_media.csv | sort -n" u 1:2 w lp lw 2 pt 7 lc rgb "red" t "C", \
    "<cat log_selection_c_*_media.csv | sort -n" u 1:2: \
        (sprintf("E: %g, T: %.8f", $1, $2)) \
        with labels offset char 2 font "Arial,8" notitle lc rgb "red", \
    "<cat log_selection_python_*_media.csv | sort -n" u 1:2 w lp lw 2 pt 7 lc rgb "purple"  t "Python", \
    "<cat log_selection_python_*_media.csv | sort -n" u 1:2: \
        (sprintf("E: %g, T: %.8f", $1, $2)) \
        with labels offset char 2 font "Arial,8" notitle lc rgb "purple"

set output "comparacao_geral_quatro_linhas.png"
set title "Comparação Geral de Médias — MergeSort e SelectionSort (C vs Python)"

plot \
    "<cat log_merge_c_*_media.csv | sort -n" u 1:2 w lp lw 2 pt 7 lc rgb "green" t "C - MergeSort", \
    "<cat log_merge_python_*_media.csv | sort -n" u 1:2 w lp lw 2 pt 7 lc rgb "blue"  t "Python - MergeSort", \
    "<cat log_selection_c_*_media.csv | sort -n" u 1:2 w lp lw 2 pt 7 lc rgb "pink" t "C - SelectionSort", \
    "<cat log_selection_python_*_media.csv | sort -n" u 1:2 w lp lw 2 pt 7 lc rgb "red"  t "Python - SelectionSort"
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
set yrange [0.000001:10000]
set logscale xy
set format y "%.7f" 


set output "comparacao_mergesort_multi_maquinas.png"
set title "Comparação das Médias — MergeSort (C vs Python) Múltiplas Máquinas"

plot \
    "<cat log_merge_c_*_mediaTiago.csv | sort -n" u 1:2 w lp lw 2 pt 7 lc rgb "dark-green" t "C - Tiago", \
    "<cat log_merge_python_*_mediaTiago.csv | sort -n" u 1:2 w lp lw 2 pt 7 lc rgb "dark-blue"  t "Python - Tiago", \
    "<cat log_merge_c_*_mediaAdrian.csv | sort -n" u 1:2 w lp lw 2 pt 6 lc rgb "orange" t "C - Adrian", \
    "<cat log_merge_python_*_mediaAdrian.csv | sort -n" u 1:2 w lp lw 2 pt 6 lc rgb "brown"  t "Python - Adrian", \
    "<cat log_merge_c_*_mediaSanderson.csv | sort -n" u 1:2 w lp lw 2 pt 5 lc rgb "gold" t "C - Sanderson", \
    "<cat log_merge_python_*_mediaSanderson.csv | sort -n" u 1:2 w lp lw 2 pt 5 lc rgb "#a02d87ff"  t "Python - Sanderson"
   
set output "comparacao_selection_multi_maquinas.png"
set title "Comparação das Médias — SelectionSort (C vs Python) Múltiplas Máquinas"

plot \
    "<cat log_selection_c_*_mediaTiago.csv | sort -n" u 1:2 w lp lw 2 pt 7 lc rgb "red" t "C - Tiago", \
    "<cat log_selection_python_*_mediaTiago.csv | sort -n" u 1:2 w lp lw 2 pt 7 lc rgb "purple"  t "Python - Tiago", \
    "<cat log_selection_c_*_mediaAdrian.csv | sort -n" u 1:2 w lp lw 2 pt 6 lc rgb "#FF00FF" t "C - Adrian", \
    "<cat log_selection_python_*_mediaAdrian.csv | sort -n" u 1:2 w lp lw 2 pt 6 lc rgb "#8A2BE2"  t "Python - Adrian", \
    "<cat log_selection_c_*_mediaSanderson.csv | sort -n" u 1:2 w lp lw 2 pt 5 lc rgb "#FF7F50" t "C - Sanderson", \
    "<cat log_selection_python_*_mediaSanderson.csv | sort -n" u 1:2 w lp lw 2 pt 5 lc rgb "#000000ff"  t "Python - Sanderson"
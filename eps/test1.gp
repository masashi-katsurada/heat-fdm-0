set logscale xy
set term postscript eps color
set output "test1.eps"
unset key
set xlabel "N"
set ylabel "Error"
plot "test1.data" using 1:3 with linespoints
quit

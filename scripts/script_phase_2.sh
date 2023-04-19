if [ $# -eq 5 ]
then
    dir=$1
    kernel=$2
    echo "Compilation et maqao dans tmp/"
else 
    echo "Mauvais nombre d'arguments. Utilisation : <cache> <nom_fichier_kernel> <n> <warmup> <n_rep> !"
    exit
fi 

cd src/

make CC=gcc OPTFLAGS=-O2 KERNEL=$kernel.c

maqao oneview -R1 -xp=../tmp --replace -- ./measure $3 $4 $5

rm -rf ../phase_2_html/$dir/$kernel/
cp -r ../tmp/RESULTS/measure_one_html/ ../phase_2_html/$dir/$kernel


if [ $# -eq 4 ]
then
    dir=$1
    echo "Compilation et maqao dans tmp/"
else 
    echo "Mauvais nombre d'arguments. Utilisation : <nom_fichier_kernel> <n> <warmup> <n_rep> !"
    exit
fi 

cd src/

make CC=gcc OPTFLAGS=-O2 KERNEL=$1.c

maqao oneview -R1 -xp=../tmp --replace -- ./measure $2 $3 $4 

rm -rf ../phase_2_html/$dir/
cp -r ../tmp/RESULTS/measure_one_html/ ../phase_2_html/$dir

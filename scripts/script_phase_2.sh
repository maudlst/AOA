if [ $# -eq 4 ]
then
    echo "Compilation et maqao dans tmp/"
else 
    echo "Mauvais nombre d'arguments. Utilisation : <nom_fichier_kernel> <n> <warmup> <n_rep> !"
    exit
fi 

cd src/

make CC=gcc OPTFLAGS=-O2 KERNEL=$1

maqao oneview -R1 -xp=../tmp --replace -- ./measure $2 $3 $4 


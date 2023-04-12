if [ $# -eq 3 ]
then
    echo "Compilation et maqao dans tmp/"
else 
    echo "Mauvais nombre d'arguments"
    exit
fi 

cd src/

make CC=gcc OPTFLAGS=-O2

maqao oneview -R1 -xp=../tmp --replace -- ./measure $1 $2 $3  


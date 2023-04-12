if [ $# -eq 3 ]
then
    dir=$1
    echo "Enregistrement dans maqao_html/"$dir
else 
    echo "Mauvais nombre d'arguments"
    exit
fi 

cd src/

make CC=gcc OPTFLAGS=-O2

maqao oneview -R1 -xp=../tmp --replace -- ./measure $1 $2 $3  


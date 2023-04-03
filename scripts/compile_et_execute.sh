#!/bin/bash

echo $@

cd src/


if [ $# -eq 5 ]
then
    dir=$1
    echo "Enregistrement dans maqao_html/"$dir
fi 

#if [[ $(lscpu | grep 'Intel') ]]; then
#    echo "Intel"
#else 
#    echo "Clang"
#fi

CC=gcc

make OPTFLAGS=-O2
if [ -f measure ]
then
    echo "Executing : maqao oneview -R1 -xp=../tmp --replace -- ./measure "$2 $3 $4 $5
    maqao oneview -R1 -xp=../tmp --replace -- ./measure $2 $3 $4 $5
    cp ../tmp/RESULTS/measure_one_html/index.html ../maqao_html/$dir/maqao_gcc_O2.html
else
    echo "Erreur : le fichier executable n'a pas été compilé avec succès."
fi

make OPTFLAGS=-O3
if [ -f measure ]
then
    echo "Executing : maqao oneview -R1 -xp=../tmp --replace -- ./measure "$2 $3 $4 $5
    maqao oneview -R1 -xp=../tmp --replace -- ./measure $2 $3 $4 $5
    cp ../tmp/RESULTS/measure_one_html/index.html ../maqao_html/$dir/maqao_gcc_O3.html
else
    echo "Erreur : le fichier executable n'a pas été compilé avec succès."
fi

make OPTFLAGS="-O3 -march=native"
if [ -f measure ]
then
    echo "Executing : maqao oneview -R1 -xp=../tmp --replace -- ./measure "$2 $3 $4 $5
    maqao oneview -R1 -xp=../tmp --replace -- ./measure $2 $3 $4 $5
    cp ../tmp/RESULTS/measure_one_html/index.html ../maqao_html/$dir/maqao_gcc_O3_Native.html
else
    echo "Erreur : le fichier executable n'a pas été compilé avec succès."
fi

which icx
if [ "$?" -eq 0 ]
then
    echo "Intel compilator found"
    CC=icx
fi
which clang
if [ "$?" -eq 0 ]
then
    echo "AMD compilator found"
    CC=clang
fi
echo $CC

if [ $CC = "gcc" ]
then
    echo "no specific compilator found"
else

    make OPTFLAGS=-O2 CC=$CC
    if [ -f measure ]; then
        echo "Executing : maqao oneview -R1 -xp=../tmp --replace -- ./measure "$2 $3 $4 $5
        maqao oneview -R1 -xp=../tmp --replace -- ./measure $2 $3 $4 $5
        cp ../tmp/RESULTS/measure_one_html/index.html ../maqao_html/$dir/maqao_$(echo $CC)_O2.html
    else
        echo "Erreur : le fichier executable n'a pas été compilé avec succès."
    fi

    make OPTFLAGS=-O3 CC=$CC
    if [ -f measure ]; then
        echo "Executing : maqao oneview -R1 -xp=../tmp --replace -- ./measure "$2 $3 $4 $5
        maqao oneview -R1 -xp=../tmp --replace -- ./measure $2 $3 $4 $5
        cp ../tmp/RESULTS/measure_one_html/index.html ../maqao_html/$dir/maqao_$(echo $CC)_O3.html
    else
        echo "Erreur : le fichier executable n'a pas été compilé avec succès."
    fi

    make OPTFLAGS="-O3 -march=native" CC=$CC
    if [ -f measure ]; then
        echo "Executing : maqao oneview -R1 -xp=../tmp --replace -- ./measure "$2 $3 $4 $5
        maqao oneview -R1 -xp=../tmp --replace -- ./measure $2 $3 $4 $5
        cp ../tmp/RESULTS/measure_one_html/index.html ../maqao_html/$dir/maqao_$(echo $CC)_O3_Native.html
    else
        echo "Erreur : le fichier executable n'a pas été compilé avec succès."
    fi
fi


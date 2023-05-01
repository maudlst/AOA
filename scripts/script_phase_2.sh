#!/bin/bash
if [ $# -eq 5 ]
then
    dir=$1
    kernel=$2
    echo "Compilation et maqao dans tmp/"
    cd src/

    make CC=gcc OPTFLAGS=-O2 KERNEL=$kernel.c
    if [ $? -eq 0 ]
    then
        maqao oneview -R1 -xp=../tmp --replace -- ./measure $3 $4 $5

        rm -rf ../phase_2_html/$dir/$kernel/
        cp -r ../tmp/RESULTS/measure_one_html/ ../phase_2_html/$dir/$kernel
    fi

elif [ $# -eq 4 ]
then
    dir=$1
    echo "||||||||||||||Attention nb d'arguments 4. Compilation intégral des kernels !||||||||||||||||||||||-"
    cd src/

    for FILE in kernels/*
    do 
        echo "DEBUGG !! $FILE"
        FILE=${FILE%.c}
        echo "DEBUGG !! $FILE"
        FILE=${FILE:8}
        echo "DEBUGG !! $FILE"
        echo "Compilation de "$FILE".c et execution. Stockage dans "$dir"/"$FILE"."
        make CC=gcc OPTFLAGS=-O2 KERNEL=$FILE.c
        if [ $? -eq 0 ]
        then
            maqao oneview -R1 -xp=../tmp --replace -- ./measure $2 $3 $4 

            rm -rf ../phase_2_html/$dir/$FILE/
            cp -r ../tmp/RESULTS/measure_one_html/ ../phase_2_html/$dir/$FILE
        fi
    done
else 
    echo "Mauvais nombre d'arguments. Utilisation : <cache> <nom_fichier_kernel> <n> <warmup> <n_rep> ! ou pour compiler tous les kernels : <cache> <n> <warmup> <n_rep> !"
    exit
fi 


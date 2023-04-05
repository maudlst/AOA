#!/bin/bash

echo $@

CC=gcc

make OPTFLAGS=-O2
if [ -f measure ]
then
    echo $(./measure $2 $3 $4)
fi

make OPTFLAGS=-O3
if [ -f measure ]
then
    echo $(./measure $2 $3 $4)
fi

make OPTFLAGS="-O3 -march=native"
if [ -f measure ]
then
    echo $(./measure $2 $3 $4) 
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
        ./measure $2 $3 $4 
    fi

    make OPTFLAGS=-O3 CC=$CC
    if [ -f measure ]; then
        ./measure $2 $3 $4 
    fi

    make OPTFLAGS="-O3 -march=native" CC=$CC
    if [ -f measure ]; then
        ./measure $2 $3 $4 
    fi
fi

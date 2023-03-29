#!/bin/bash
cd ../src
ls
make
if [ -f measure ]; then
    ./measure "$@"
else
    echo "Erreur : le fichier executable n'a pas été compilé avec succès."
fi


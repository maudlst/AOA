#!/bin/bash
cd ../src
ls
make
if [ -f measure ]; then
     maqao oneview -R1 -xp=../maqao_html --replace -- ./measure "$@"
else
    echo "Erreur : le fichier executable n'a pas été compilé avec succès."
fi


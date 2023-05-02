## Execution phase 1
bash script/compile_et_execute.sh cache n warmup repetition

## Execution phase 2 
bash script/script_phase_2.sh 
Utilisation : <cache> <nom_fichier_kernel> <n> <warmup> <n_rep> !
ou pour compiler tous les kernels : <cache> <n> <warmup> <n_rep> !

les kernels se trouvent dans src/kernels/
il ne faut pas spécifier l'extension ".c" au script.

<Cache> = RAM ou L1 ou L2 ou L3


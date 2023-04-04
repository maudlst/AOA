#include <stdio.h>
#include <stdlib.h> // atoi, qsort
#include <stdint.h>
#include <unistd.h>

#define NB_METAS 31



extern uint64_t rdtsc();
extern void kernel(unsigned n, float a[n], const float b[n]);
extern void init_array(int n, float b[n]);


static int cmp_uint64 (const void *a, const void *b){
    const uint64_t va = *((uint64_t *) a);
    const uint64_t vb = *((uint64_t *) b);

    if (va < vb) return -1;
    if (va > vb) return 1;
    return 0;
}


int main(int argc, char *argv[])
{
    /* check command line arguments */
    if (argc != 3)
    {
        fprintf(stderr, "Usage: %s <size> <nombre de repetitions pendant la mesure>\n", argv[0]);
        return 1;
    }

    /* get command line arguments */
    const unsigned size = atoi(argv[1]); /* problem size */
    //const char *output_file_name = argv[2];

   

    int nb_repm = atoi(argv[2]);
    printf("mediane;stabilité\n");

    uint64_t temps_diff[nb_repm][NB_METAS];

    for (int m = 0; m < NB_METAS; m++)
    {

         /* allocate arrays.  */
        float *a = malloc(size * sizeof a[0]);
        float *b = malloc(size * sizeof b[0]);

        /* init arrays */
        srand(0);
        init_array(size, b);

        for (int j = 0; j < nb_repm; j++)
        {
            uint64_t temps_deb = rdtsc();
            kernel(size, a, b);
            uint64_t temps_fin = rdtsc();

            temps_diff[j][m] = temps_fin - temps_deb;
        }

        /* free arrays.  */
        free(a);
        free(b);

        sleep(3);

    }

    for(int j = 0; j < nb_repm; j++)
    {
        const unsigned nb_iters = size * nb_repm;
        qsort(temps_diff[j], NB_METAS, sizeof temps_diff[j][0], cmp_uint64);
        //printf("Minimum %lu RDTSC-cycles (%.2f per iner-iter)\n", 
        //        temps_diff[j][0], (float)temps_diff[j][0] / nb_iters);
        //printf("Mediane %lu RDTSC-cycles (%.2f per iner-iter)\n", 
        //        temps_diff[j][NB_METAS/2], (float)temps_diff[j][NB_METAS/2] / nb_iters);
        const float stab = (temps_diff[j][NB_METAS/2] - temps_diff[j][0]) * 100.0f / temps_diff[j][0];
        printf("%lu;%.2f\n", temps_diff[j][NB_METAS/2], stab);

        /*
        if(stab >= 10)
        {
            printf("Mauvaise stabilité : %.2f %%\n", stab);
        }
        else if (stab >= 5)
        {
            printf("Moyenne stabilité : %.2f %%\n", stab);
        }
        else
        {
            printf("Bonne stabilité : %.2f %%\n", stab);
        }
        */
    }



    return EXIT_SUCCESS;
}

#include <stdio.h>
#include <stdlib.h> // atoi, qsort
#include <stdint.h>

#define NB_METAS 31

#include <stdint.h>

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
    if (argc != 5)
    {
        fprintf(stderr, "Usage: %s <size> <output file name> <nombre de warmups> <nombre de repetitions pendant la mesure>\n", argv[0]);
        return 1;
    }

    /* get command line arguments */
    const unsigned size = atoi(argv[1]); /* problem size */
    //const char *output_file_name = argv[2];

   

    // warmup
    int nb_repm = atoi(argv[4]);
    int nb_repw = atoi(argv[3]);
    uint64_t temps_diff[NB_METAS];

    for (int m = 0; m < NB_METAS; m++)
    {

         /* allocate arrays.  */
        float *a = malloc(size * sizeof a[0]);
        float *b = malloc(size * sizeof b[0]);

        /* init arrays */
        srand(0);
        init_array(size, b);

        if (m == 0)
        {
            for (int i = 0; i < nb_repw; i++)
            {
                kernel(size, a, b);
            }
        }
        else
        {
            kernel(size, a, b);
        }
        uint64_t temps_deb = rdtsc();
        for (int j = 0; j < nb_repm; j++)
        {
            kernel(size, a, b);
        }
        uint64_t temps_fin = rdtsc();

        temps_diff[m] = temps_fin - temps_deb;

        /* free arrays.  */
        free(a);
        free(b);
    }

    const unsigned nb_iters = size * nb_repm;
    qsort(temps_diff, NB_METAS, sizeof temps_diff[0], cmp_uint64);
    printf("Minimum %lu RDTSC-cycles (%.2f per iner-iter)\n", 
            temps_diff[0], (float)temps_diff[0] / nb_iters);
    printf("Mediane %lu RDTSC-cycles (%.2f per iner-iter)\n", 
            temps_diff[NB_METAS/2], (float)temps_diff[NB_METAS/2] / nb_iters);
    const float stab = (temps_diff[NB_METAS/2] - temps_diff[0]) * 100.0f / temps_diff[0];

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



    return EXIT_SUCCESS;
}
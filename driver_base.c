#include <stdio.h>
#include <stdlib.h> // atoi, qsort
#include <stdint.h>

extern uint64_t rdtsc ();
extern void kernel(unsigned n, float a[n], const float b[n]);
extern void init_array (int n, float b[n]);
extern void print_array (int n, float a[n], const char *output_file_name);

int main (int argc, char *argv[]) {
   /* check command line arguments */
   if (argc != 3) {
      fprintf (stderr, "Usage: %s <size> <output file name>\n", argv[0]);
      return 1;
   }

   /* get command line arguments */
   const unsigned size = atoi (argv[1]); /* problem size */
   const char *output_file_name = argv[2];

   /* allocate arrays. TODO: adjust for each kernel */
   float *a = malloc (size * sizeof a[0]);
   float *b = malloc (size * sizeof b[0]);
   
   /* init arrays */
   srand(0);
   init_array (size, b);

   /* print output */
   kernel (size, a, b);
   print_array (size, a, output_file_name);

   /* free arrays. TODO: adjust for each kernel */
   free (a);
   free (b);

   return EXIT_SUCCESS;
}
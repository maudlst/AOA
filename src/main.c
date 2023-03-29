#include <stdio.h>
#include <stdlib.h> // malloc , free

#define NB_METAS 31

void baseline (unsigned n, float a[n], const float b[n]){
	unsigned i ;
	double s = 0.0;
	float *tmp = malloc(n * sizeof(*tmp));
	for (i =0; i < n; i++){
		tmp[i] = i + b[i];
		s += tmp[i];
	}
	for (i =0; i < n; i++)
		a [i] = tmp [i] / s ;
	free(tmp);
}

int main(int argc, char* argv[]){
	//int m, r;

	int n = atoi(argv[1]); // taille de probleme
	char* nom_fichier = argv[2]; // nom de fichier de sortie
	
	float* a;
	float* b;
	a = (float*)malloc(n * sizeof(float));
	b = (float*)malloc(n * sizeof(float));
	
	baseline(n, a, b);
	
	FILE *f = fopen(nom_fichier, "w, ccs=UTF-8");
	if (f == NULL) {
        	printf("Error: could not open file.\n");
        	return 1;
    	}
	
	// write the data to the file
    size_t num_elements_a = sizeof(a) / sizeof(float);
	size_t num_elements_b = sizeof(b) / sizeof(float);

    size_t num_written_a = fwrite(a, sizeof(float), num_elements_a, f);
	size_t num_written_b = fwrite(b, sizeof(float), num_elements_b, f);
    if ((num_written_a != num_elements_a) || (num_written_b != num_elements_b)) 
    {
    	printf("Error: could not write all elements.\n");
        return 1;
    }

    free(a);
    free(b);
    // close the file
    fclose(f);
	
	return 0;
}
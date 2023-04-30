#include <stdio.h>
#include <stdlib.h>

void kernel(unsigned n, float a[n], const float b[n])
{
    unsigned i;
    float s = 0.0f;
    float *tmp = malloc(n * sizeof(*tmp));
    for (i = 0; i < n - 4; i = i + 4)
    {
        tmp[i] = i + b[i];
	tmp[i+1] = i+1 + b[i+1];
	tmp[i+2] = i+2 + b[i+2];
	tmp[i+3] = i+3 + b[i+3];
        s += tmp[i] + tmp[i+1] + tmp[i+2] + tmp[i+3];
    }
 
    for(; i < n; i++)
    {
	tmp[i] = i + b[i];
	s += tmp[i];
    }
    const float inv_s = 1 / s;
    for (i = 0; i < n - 4; i = i+4)
    {
        a[i] = tmp[i] * inv_s;
        a[i+1] = tmp[i+1] * inv_s;
        a[i+2] = tmp[i+2] * inv_s;
        a[i+3] = tmp[i+3] * inv_s;
    }
    for(; i < n; i++)
    {    
        a[i] = tmp[i] * inv_s;
    }
    free(tmp);
}

void init_array(int n, float b[n])
{
    int i;

    for (i = 0; i < n; i++)
        b[i] = (float)rand() / RAND_MAX;
}

void print_array(int n, float a[n], const char *output_file_name)
{
    int i;

    FILE *fp = fopen(output_file_name, "w");
    if (fp == NULL)
    {
        fprintf(stderr, "Cannot write to %s\n", output_file_name);
        return;
    }

    for (i = 0; i < n; i++)
        fprintf(fp, "%f\n", a[i]);

    fclose(fp);
}

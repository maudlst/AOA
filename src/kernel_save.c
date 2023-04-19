#include <stdio.h>
#include <stdlib.h>

void kernel(unsigned n, float a[n], const float b[n])
{
    unsigned i;
    float s = 0.0;
    float *tmp = malloc(n * sizeof(*tmp));
    for (i = 0; i < n; i++)
    {
        tmp[i] = i + b[i];
        s += tmp[i];
    }
    for (i = 0; i < n; i++)
        a[i] = tmp[i] / s;
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

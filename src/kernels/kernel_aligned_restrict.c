#include <stdio.h>
#include <stdlib.h>

void kernel(const unsigned n, float * restrict a, const float * restrict b)
{
    unsigned i;
    float s = 0.0f;
    float *tmp = aligned_alloc(sizeof(*tmp), n * sizeof(*tmp));
    for (i = 0; i < n; i++)
    {
        tmp[i] = i + b[i];
        s += tmp[i];
    }
    const float inv_s = 1 / s;
    for (i = 0; i < n; i++)
        a[i] = tmp[i] * inv_s;
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

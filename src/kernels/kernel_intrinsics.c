#include <stdio.h>
#include <stdlib.h>
#ifdef __AVX__
  #include <immintrin.h>
#else
  #warning AVX is not available. Code will not compile!
#endif

#ifdef __SSE2__
  #include <emmintrin.h>
#else
  #warning SSE2 is not available. Code will not compile!
#endif

void kernel(unsigned n, float a[n], const float b[n])
{
    unsigned i;
    float s = 0.0f;
    float *tmp = aligned_alloc(8, n * sizeof(*tmp));
    for (i = 0; i < n; i++)
    {
        tmp[i] = i + b[i];
        s += tmp[i];
    }
    __m128 tmp_vec;

    const float inv_s = 1 / s;
    const __m128 inv_s_vec = _mm_set_ps(inv_s, inv_s, inv_s, inv_s);
    for (i = 0; i < n; i+=4)
    {
        tmp_vec = _mm_load_ps(&tmp[i]);
        _mm_store_ps(&a[i], _mm_mul_ps(tmp_vec, inv_s_vec));
    }
    i = i - 4;
    for (; i < n; i++)
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

#include <stdio.h>
#include <stdlib.h>

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
    __m128 tmp_vec;

    const float inv_s = 1 / s;
    const __m128 inv_s_vec = _mm_set_ps(inv_s, inv_s, inv_s, inv_s);
    for (i = 0; i < n - 16 ; i+=16)
    {
        tmp_vec = _mm_load_ps(&tmp[i]);
        _mm_store_ps(&a[i], _mm_mul_ps(tmp_vec, inv_s_vec));
        tmp_vec = _mm_load_ps(&tmp[i+4]);
        _mm_store_ps(&a[i+4], _mm_mul_ps(tmp_vec, inv_s_vec));
        tmp_vec = _mm_load_ps(&tmp[i+8]);
        _mm_store_ps(&a[i+8], _mm_mul_ps(tmp_vec, inv_s_vec));
        tmp_vec = _mm_load_ps(&tmp[i+12]);
        _mm_store_ps(&a[i+12], _mm_mul_ps(tmp_vec, inv_s_vec));
    }
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

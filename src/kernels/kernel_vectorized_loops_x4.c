#include <stdio.h>
#include <stdlib.h>

#ifdef __SSE2__
  #include <emmintrin.h>
#else
  #warning SSE2 is not available. Code will not compile!
#endif

void kernel(unsigned n, float * restrict a, const float * restrict b)
{
    unsigned i;
    float s = 0.0f;
    float *tmp = aligned_alloc(sizeof(*tmp), n * sizeof(*tmp));
    float i_float;

    __m128 ivals_vec, b_vec, tmp_vec, s_vec = _mm_set_ps(0.0f, 0.0f, 0.0f, 0.0f);


    const int stop_boucle = n - 16;
    for (i = 0; i < stop_boucle; i+=16)
    {
        i_float = (float)i;
        ivals_vec = _mm_set_ps(i_float, i_float+1, i_float+2, i_float+3);
        b_vec = _mm_load_ps(&b[i]);
        tmp_vec = _mm_add_ps(b_vec, ivals_vec);
        s_vec = _mm_add_ps(tmp_vec, s_vec);
        
        _mm_store_ps(&tmp[i], tmp_vec);

        i_float += 4;
        ivals_vec = _mm_set_ps(i_float, i_float+1, i_float+2, i_float+3);
        b_vec = _mm_load_ps(&b[i+4]);
        tmp_vec = _mm_add_ps(b_vec, ivals_vec);
        s_vec = _mm_add_ps(tmp_vec, s_vec);
        
        _mm_store_ps(&tmp[i+4], tmp_vec);

        i_float += 4;
        ivals_vec = _mm_set_ps(i_float, i_float+1, i_float+2, i_float+3);
        b_vec = _mm_load_ps(&b[i+8]);
        tmp_vec = _mm_add_ps(b_vec, ivals_vec);
        s_vec = _mm_add_ps(tmp_vec, s_vec);
        
        _mm_store_ps(&tmp[i+8], tmp_vec);

        i_float += 4;
        ivals_vec = _mm_set_ps(i_float, i_float+1, i_float+2, i_float+3);
        b_vec = _mm_load_ps(&b[i+12]);
        tmp_vec = _mm_add_ps(b_vec, ivals_vec);
        s_vec = _mm_add_ps(tmp_vec, s_vec);
        
        _mm_store_ps(&tmp[i+12], tmp_vec);
    }
    // HADDPS trouvé à https://stackoverflow.com/questions/6996764/fastest-way-to-do-horizontal-sse-vector-sum-or-other-reduction
    __m128 shuf   = _mm_shuffle_ps(s_vec, s_vec, _MM_SHUFFLE(2, 3, 0, 1));  // [ C D | A B ]
    __m128 sums   = _mm_add_ps(s_vec, shuf);      // sums = [ D+C C+D | B+A A+B ]
    shuf          = _mm_movehl_ps(shuf, sums);      //  [   C   D | D+C C+D ]  // let the compiler avoid a mov by reusing shuf
    sums          = _mm_add_ss(sums, shuf);
    s = _mm_cvtss_f32(sums);

    for (; i < n; i++)
    {
        tmp[i] = i + b[i];
        s += tmp[i];
    }

    const float inv_s = 1 / s;
    const __m128 inv_s_vec = _mm_load1_ps(&inv_s);
    for (i = 0; i < stop_boucle; i+=16)
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

_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision. In C/C++, FP constants are double precision by default and must be suffixed by 'f' to make them single precision.",
          details = " - VCVTSI2SS (INT32/64 to FP32, scalar): 1 occurrences\n - VCVTSS2SD (FP32 to FP64, scalar): 1 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "1 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n1 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 2 FP arithmetical operations:\n - 2: addition or subtraction\nThe binary loop is loading 4 bytes (1 single precision FP elements).\nThe binary loop is storing 4 bytes (1 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.25 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 9\nnb uops            : 8\nloop length        : 34\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 3\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 1.33 cycles\nfront end            : 1.33 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2  | FP3\n-----------------------------------------------------------------------------------\nuops   | 0.75 | 0.75 | 1.00 | 0.50 | 0.83 | 0.50 | 0.67 | 0.00 | 0.00 | 2.50 | 2.50\ncycles | 0.75 | 0.75 | 1.00 | 0.50 | 0.83 | 0.50 | 0.67 | 0.00 | 0.00 | 2.50 | 2.50\n\nCycles executing div or sqrt instructions: NA\nCycles loading/storing data              : 1.00\nLongest recurrence chain latency (RecMII): 3.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 1.33\nDispatch  : 2.50\nData deps.: 3.00\nOverall L1: 3.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 0%\nFP\nall     : 0%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 0%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\nINT+FP\nall     : 0%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 0%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 18%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 18%\nFP\nall     : 15%\nload    : 12%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 18%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 12%\nINT+FP\nall     : 16%\nload    : 12%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 18%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 16%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 3.00 cycles. At this rate:\n - 2% of peak load performance is reached (1.33 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 4% of peak store performance is reached (1.33 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 201c10\n\nInstruction                      | Nb FU | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0 | FP1 | FP2  | FP3  | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------------------------------\nMOV %ECX,%EDX                    | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0    | 0    | 0       | 0.25\nVCVTSI2SS %RDX,%XMM2,%XMM1       | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0    | 0   | 0   | 0    | 1    | 4       | 1\nVADDSS (%R14,%RCX,4),%XMM1,%XMM1 | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0    | 0   | 0   | 0.50 | 0.50 | 3       | 0.50\nVMOVSS %XMM1,(%RAX,%RCX,4)       | 1     | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0   | 0   | 1    | 0    | 1       | 1\nVCVTSS2SD %XMM1,%XMM1,%XMM1      | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0    | 1    | 3       | 1\nINC %RCX                         | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0   | 0    | 0    | 1       | 0.25\nVADDSD %XMM1,%XMM0,%XMM0         | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0.50 | 0.50 | 3       | 0.50\nCMP %RCX,%RBP                    | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0   | 0    | 0    | 1       | 0.25\nJNE 201c10 <kernel+0x30>         | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0   | 0    | 0    | 1       | 0.50\n",
        },
      },
      header = {
        "1% of peak computational performance is used (0.67 out of 48.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly:\nC storage order is row-major: for(i) for(j) a[j][i] = b[j][i]; (slow, non stride 1) => for(i) for(j) a[i][j] = b[i][j]; (fast, stride 1)\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\nOnly 16% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 3.00 to 0.50 cycles (6.00x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
  },
  AVG = {
      hint = {
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision. In C/C++, FP constants are double precision by default and must be suffixed by 'f' to make them single precision.",
          details = " - VCVTSI2SS (INT32/64 to FP32, scalar): 1 occurrences\n - VCVTSS2SD (FP32 to FP64, scalar): 1 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "1 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n1 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 2 FP arithmetical operations:\n - 2: addition or subtraction\nThe binary loop is loading 4 bytes (1 single precision FP elements).\nThe binary loop is storing 4 bytes (1 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.25 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 9\nnb uops            : 8\nloop length        : 34\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 3\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 1.33 cycles\nfront end            : 1.33 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2  | FP3\n-----------------------------------------------------------------------------------\nuops   | 0.75 | 0.75 | 1.00 | 0.50 | 0.83 | 0.50 | 0.67 | 0.00 | 0.00 | 2.50 | 2.50\ncycles | 0.75 | 0.75 | 1.00 | 0.50 | 0.83 | 0.50 | 0.67 | 0.00 | 0.00 | 2.50 | 2.50\n\nCycles executing div or sqrt instructions: NA\nCycles loading/storing data              : 1.00\nLongest recurrence chain latency (RecMII): 3.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 1.33\nDispatch  : 2.50\nData deps.: 3.00\nOverall L1: 3.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 0%\nFP\nall     : 0%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 0%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\nINT+FP\nall     : 0%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 0%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 18%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 18%\nFP\nall     : 15%\nload    : 12%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 18%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 12%\nINT+FP\nall     : 16%\nload    : 12%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 18%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 16%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 3.00 cycles. At this rate:\n - 2% of peak load performance is reached (1.33 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 4% of peak store performance is reached (1.33 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 201c10\n\nInstruction                      | Nb FU | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0 | FP1 | FP2  | FP3  | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------------------------------\nMOV %ECX,%EDX                    | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0    | 0    | 0       | 0.25\nVCVTSI2SS %RDX,%XMM2,%XMM1       | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0    | 0   | 0   | 0    | 1    | 4       | 1\nVADDSS (%R14,%RCX,4),%XMM1,%XMM1 | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0    | 0   | 0   | 0.50 | 0.50 | 3       | 0.50\nVMOVSS %XMM1,(%RAX,%RCX,4)       | 1     | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0   | 0   | 1    | 0    | 1       | 1\nVCVTSS2SD %XMM1,%XMM1,%XMM1      | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0    | 1    | 3       | 1\nINC %RCX                         | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0   | 0    | 0    | 1       | 0.25\nVADDSD %XMM1,%XMM0,%XMM0         | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0.50 | 0.50 | 3       | 0.50\nCMP %RCX,%RBP                    | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0   | 0    | 0    | 1       | 0.25\nJNE 201c10 <kernel+0x30>         | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0   | 0    | 0    | 1       | 0.50\n",
        },
      },
      header = {
        "1% of peak computational performance is used (0.67 out of 48.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly:\nC storage order is row-major: for(i) for(j) a[j][i] = b[j][i]; (slow, non stride 1) => for(i) for(j) a[i][j] = b[i][j]; (fast, stride 1)\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\nOnly 16% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 3.00 to 0.50 cycles (6.00x speedup).",
        },
        {
          title = "Execution units bottlenecks",
          txt = "Found no such bottlenecks but see expert reports for more complex bottlenecks.",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "The loop is defined in /home/ahenches/Documents/isty/AOA/src/kernel.c:9-12.\n",
      "The related source loop is not unrolled or unrolled with no peel/tail loop.",
    },
    nb_paths = 1,
  },
}

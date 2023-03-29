_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = " - CVTSD2SS (FP64 to FP32, scalar): 1 occurrences\n - CVTSS2SD (FP32 to FP64, scalar): 1 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "1 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 1 FP arithmetical operations:\n - 1: divide\nThe binary loop is loading 4 bytes (0 double precision FP elements).\nThe binary loop is storing 4 bytes (0 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 8\nnb uops            : 7\nloop length        : 32\nused x86 registers : 4\nused mmx registers : 0\nused xmm registers : 2\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 1.17 cycles\nfront end            : 1.17 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | ALU0 | ALU1 | ALU2 | ALU3 | BRU  | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2  | FP3  | FP4  | FP5\n--------------------------------------------------------------------------------------------------------\nuops   | 0.50 | 0.50 | 0.25 | 0.25 | 0.50 | 0.67 | 0.67 | 0.67 | 0.50 | 0.50 | 1.00 | 1.00 | 0.50 | 0.50\ncycles | 0.50 | 0.50 | 0.25 | 0.25 | 0.50 | 0.67 | 0.67 | 0.67 | 0.50 | 0.50 | 1.00 | 1.00 | 0.50 | 0.50\n\nCycles executing div or sqrt instructions: 4.50\nCycles loading/storing data              : 1.00\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 1.17\nDispatch  : 1.00\nDIV/SQRT  : 4.50\nData deps.: 1.00\nOverall L1: 4.50\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 100%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 100%\nFP\nall     : 0%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 0%\nother   : 0%\nINT+FP\nall     : 20%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 0%\nother   : 33%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 50%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 50%\nFP\nall     : 18%\nload    : 12%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 25%\nother   : 18%\nINT+FP\nall     : 25%\nload    : 12%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 25%\nother   : 29%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 4.50 cycles. At this rate:\n - 0% of peak load performance is reached (0.89 out of 96.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 2% of peak store performance is reached (0.89 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 15c0\n\nInstruction                  | Nb FU | ALU0 | ALU1 | ALU2 | ALU3 | BRU  | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2  | FP3  | FP4  | FP5  | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------------------------------------------------\nPXOR %XMM0,%XMM0             | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0       | 0.25\nCVTSS2SD (%RDI,%RAX,4),%XMM0 | 1     | 0    | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 3       | 0.50\nDIVSD %XMM1,%XMM0            | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 13      | 4.50\nCVTSD2SS %XMM0,%XMM0         | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 3       | 0.50\nMOVSS %XMM0,(%RBP,%RAX,4)    | 1     | 0    | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 1\nADD $0x1,%RAX                | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nCMP %RAX,%RBX                | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nJNE 15c0 <kernel+0x60>       | 1     | 0.50 | 0    | 0    | 0    | 0.50 | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.50-1\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.22 out of 24.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is probably not vectorized.\nOnly 25% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 4.50 to 1.12 cycles (4.00x speedup).",
        },
        {
          workaround = " - Reduce the number of division or square root instructions:\n  * If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n - Check whether you really need double precision. If not, switch to single precision to speedup execution\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of divide and square root operations (the divide/square root unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 4.50 to 1.17 cycles (3.86x speedup).\n",
        },
      },
      potential = {
        {
          title = "Expensive FP math instructions/calls",
          txt = "Detected performance impact from expensive FP math instructions/calls.\nBy removing/reexpressing them, you can lower the cost of an iteration from 4.50 to 1.50 cycles (3.00x speedup).",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = " - CVTSD2SS (FP64 to FP32, scalar): 1 occurrences\n - CVTSS2SD (FP32 to FP64, scalar): 1 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "1 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 1 FP arithmetical operations:\n - 1: divide\nThe binary loop is loading 4 bytes (0 double precision FP elements).\nThe binary loop is storing 4 bytes (0 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 8\nnb uops            : 7\nloop length        : 32\nused x86 registers : 4\nused mmx registers : 0\nused xmm registers : 2\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 1.17 cycles\nfront end            : 1.17 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | ALU0 | ALU1 | ALU2 | ALU3 | BRU  | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2  | FP3  | FP4  | FP5\n--------------------------------------------------------------------------------------------------------\nuops   | 0.50 | 0.50 | 0.25 | 0.25 | 0.50 | 0.67 | 0.67 | 0.67 | 0.50 | 0.50 | 1.00 | 1.00 | 0.50 | 0.50\ncycles | 0.50 | 0.50 | 0.25 | 0.25 | 0.50 | 0.67 | 0.67 | 0.67 | 0.50 | 0.50 | 1.00 | 1.00 | 0.50 | 0.50\n\nCycles executing div or sqrt instructions: 4.50\nCycles loading/storing data              : 1.00\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 1.17\nDispatch  : 1.00\nDIV/SQRT  : 4.50\nData deps.: 1.00\nOverall L1: 4.50\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 100%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 100%\nFP\nall     : 0%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 0%\nother   : 0%\nINT+FP\nall     : 20%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 0%\nother   : 33%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 50%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 50%\nFP\nall     : 18%\nload    : 12%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 25%\nother   : 18%\nINT+FP\nall     : 25%\nload    : 12%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 25%\nother   : 29%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 4.50 cycles. At this rate:\n - 0% of peak load performance is reached (0.89 out of 96.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 2% of peak store performance is reached (0.89 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 15c0\n\nInstruction                  | Nb FU | ALU0 | ALU1 | ALU2 | ALU3 | BRU  | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2  | FP3  | FP4  | FP5  | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------------------------------------------------\nPXOR %XMM0,%XMM0             | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0       | 0.25\nCVTSS2SD (%RDI,%RAX,4),%XMM0 | 1     | 0    | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 3       | 0.50\nDIVSD %XMM1,%XMM0            | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 0    | 0    | 13      | 4.50\nCVTSD2SS %XMM0,%XMM0         | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0    | 0    | 3       | 0.50\nMOVSS %XMM0,(%RBP,%RAX,4)    | 1     | 0    | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 1       | 1\nADD $0x1,%RAX                | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nCMP %RAX,%RBX                | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.25\nJNE 15c0 <kernel+0x60>       | 1     | 0.50 | 0    | 0    | 0    | 0.50 | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0.50-1\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.22 out of 24.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is probably not vectorized.\nOnly 25% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 4.50 to 1.12 cycles (4.00x speedup).",
        },
        {
          workaround = " - Reduce the number of division or square root instructions:\n  * If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n - Check whether you really need double precision. If not, switch to single precision to speedup execution\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of divide and square root operations (the divide/square root unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 4.50 to 1.17 cycles (3.86x speedup).\n",
        },
      },
      potential = {
        {
          title = "Expensive FP math instructions/calls",
          txt = "Detected performance impact from expensive FP math instructions/calls.\nBy removing/reexpressing them, you can lower the cost of an iteration from 4.50 to 1.50 cycles (3.00x speedup).",
        },
      },
    },
  common = {
    header = {
      "",
    },
    nb_paths = 1,
  },
}

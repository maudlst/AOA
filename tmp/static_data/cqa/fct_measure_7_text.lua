_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function does not load or store any data.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 14\nnb uops            : 14\nloop length        : 49\nused x86 registers : 6\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 2.33 cycles\nfront end            : 2.33 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2  | FP3\n-----------------------------------------------------------------------------------\nuops   | 1.25 | 1.25 | 1.25 | 1.25 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00\ncycles | 1.25 | 1.25 | 1.25 | 1.25 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 2.33\nDispatch  : 1.25\nOverall L1: 2.33\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 0%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 16%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 16%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 2.33 cycles. At this rate:\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 2.33 to 1.25 cycles (1.87x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 201d10\n\nInstruction                  | Nb FU | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0 | FP1 | FP2 | FP3 | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------------------------\nPUSH %R15                    | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 1\nPUSH %R14                    | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 1\nPUSH %RBX                    | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 1\nTEST %EDI,%EDI               | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.25\nJLE 201d4f <init_array+0x3f> | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.50\nMOV %RSI,%R14                | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0       | 0.25\nMOV %EDI,%R15D               | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0       | 0.25\nXOR %EBX,%EBX                | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0       | 0.25\nNOPW %CS:(%RAX,%RAX,1)       | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.25\nPOP %RBX                     | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.50\nPOP %R14                     | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.50\nPOP %R15                     | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.50\nRET                          | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.50\nNOPW %CS:(%RAX,%RAX,1)       | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.25\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 6.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\nOnly 16% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 2.33 to 0.29 cycles (8.00x speedup).",
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
          title = "Type of elements and instruction set",
          txt = "No instructions are processing arithmetic or math operations on FP elements. This function is probably writing/copying data or processing integer elements.",
        },
        {
          title = "Matching between your function (in the source code) and the binary function",
          txt = "The binary function does not contain any FP arithmetical operations.\nThe binary function does not load or store any data.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 14\nnb uops            : 14\nloop length        : 49\nused x86 registers : 6\nused mmx registers : 0\nused xmm registers : 0\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 2.33 cycles\nfront end            : 2.33 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2  | FP3\n-----------------------------------------------------------------------------------\nuops   | 1.25 | 1.25 | 1.25 | 1.25 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00\ncycles | 1.25 | 1.25 | 1.25 | 1.25 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 2.33\nDispatch  : 1.25\nOverall L1: 2.33\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 0%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 16%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 16%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 2.33 cycles. At this rate:\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 2.33 to 1.25 cycles (1.87x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 201d10\n\nInstruction                  | Nb FU | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0 | FP1 | FP2 | FP3 | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------------------------\nPUSH %R15                    | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 1\nPUSH %R14                    | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 1\nPUSH %RBX                    | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 1\nTEST %EDI,%EDI               | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.25\nJLE 201d4f <init_array+0x3f> | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.50\nMOV %RSI,%R14                | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0       | 0.25\nMOV %EDI,%R15D               | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0       | 0.25\nXOR %EBX,%EBX                | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0       | 0.25\nNOPW %CS:(%RAX,%RAX,1)       | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.25\nPOP %RBX                     | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.50\nPOP %R14                     | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.50\nPOP %R15                     | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.50\nRET                          | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.50\nNOPW %CS:(%RAX,%RAX,1)       | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.25\n",
        },
      },
      header = {
        "0% of peak computational performance is used (0.00 out of 6.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is not vectorized.\nOnly 16% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 2.33 to 0.29 cycles (8.00x speedup).",
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
      "The function is defined in /home/ahenches/Documents/isty/AOA/src/kernel.c:20-25.\n",
      "Warnings:\nIgnoring paths for analysis",
    },
  },
}

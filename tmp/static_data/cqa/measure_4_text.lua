_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - unknown: 1 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements.",
          details = " - VCVTSI2SS (INT32/64 to FP32, scalar): 1 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "1 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 1 FP arithmetical operations:\n - 1: multiply\nThe binary loop is loading 4 bytes (1 single precision FP elements).\nThe binary loop is storing 4 bytes (1 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
        {
          workaround = "Unroll your loop if trip count is significantly higher than target unroll factor. This can be done manually.",
          title = "Unroll opportunity",
          txt = "Loop body is too small to efficiently use resources.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 7\nnb uops            : 11\nloop length        : 31\nused x86 registers : 4\nused mmx registers : 0\nused xmm registers : 2\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 1.83 cycles\nfront end            : 1.83 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2  | FP3\n-----------------------------------------------------------------------------------\nuops   | 2.00 | 2.00 | 2.00 | 2.00 | 1.00 | 1.00 | 1.00 | 0.50 | 0.50 | 1.00 | 1.00\ncycles | 2.00 | 2.00 | 2.00 | 2.00 | 1.00 | 1.00 | 1.00 | 0.50 | 0.50 | 1.00 | 1.00\n\nCycles executing div or sqrt instructions: NA\nCycles loading/storing data              : 1.00\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 1.83\nDispatch  : 2.00\nData deps.: 1.00\nOverall L1: 2.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 0%\nFP\nall     : 0%\nload    : 0%\nstore   : 0%\nmul     : 0%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall     : 0%\nload    : 0%\nstore   : 0%\nmul     : 0%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 12%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 12%\nFP\nall     : 12%\nload    : 12%\nstore   : 12%\nmul     : 12%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall     : 12%\nload    : 12%\nstore   : 12%\nmul     : 12%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 12%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 2.00 cycles. At this rate:\n - 3% of peak load performance is reached (2.00 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 6% of peak store performance is reached (2.00 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 201d30\n\nInstruction                      | Nb FU | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2 | FP3 | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------------------------------\nCALL 202180 <@plt_start@+0x30>   | 6     | 1.25 | 1.25 | 1.25 | 1.25 | 0.50 | 0.50 | 0    | 0    | 0    | 0   | 0   | 0       | 1\nVCVTSI2SS %EAX,%XMM1,%XMM0       | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 1   | 4       | 1\nVMULSS -0x1601(%RIP),%XMM0,%XMM0 | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0    | 0.50 | 0.50 | 0   | 0   | 3       | 0.50\nVMOVSS %XMM0,(%R14,%RBX,4)       | 1     | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 1   | 0   | 1       | 1\nINC %RBX                         | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 1       | 0.25\nCMP %RBX,%R15                    | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 1       | 0.25\nJNE 201d30 <init_array+0x20>     | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 1       | 0.50\n",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "1% of peak computational performance is used (0.50 out of 48.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 2.00 to 1.00 cycles (2.00x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly:\nC storage order is row-major: for(i) for(j) a[j][i] = b[j][i]; (slow, non stride 1) => for(i) for(j) a[i][j] = b[i][j]; (fast, stride 1)\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n8 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 2.00 to 0.25 cycles (8.00x speedup).",
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
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - unknown: 1 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements.",
          details = " - VCVTSI2SS (INT32/64 to FP32, scalar): 1 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "1 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 1 FP arithmetical operations:\n - 1: multiply\nThe binary loop is loading 4 bytes (1 single precision FP elements).\nThe binary loop is storing 4 bytes (1 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
        {
          workaround = "Unroll your loop if trip count is significantly higher than target unroll factor. This can be done manually.",
          title = "Unroll opportunity",
          txt = "Loop body is too small to efficiently use resources.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 7\nnb uops            : 11\nloop length        : 31\nused x86 registers : 4\nused mmx registers : 0\nused xmm registers : 2\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 1.83 cycles\nfront end            : 1.83 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2  | FP3\n-----------------------------------------------------------------------------------\nuops   | 2.00 | 2.00 | 2.00 | 2.00 | 1.00 | 1.00 | 1.00 | 0.50 | 0.50 | 1.00 | 1.00\ncycles | 2.00 | 2.00 | 2.00 | 2.00 | 1.00 | 1.00 | 1.00 | 0.50 | 0.50 | 1.00 | 1.00\n\nCycles executing div or sqrt instructions: NA\nCycles loading/storing data              : 1.00\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 1.83\nDispatch  : 2.00\nData deps.: 1.00\nOverall L1: 2.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 0%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 0%\nFP\nall     : 0%\nload    : 0%\nstore   : 0%\nmul     : 0%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall     : 0%\nload    : 0%\nstore   : 0%\nmul     : 0%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 12%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 12%\nFP\nall     : 12%\nload    : 12%\nstore   : 12%\nmul     : 12%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : NA (no other vectorizable/vectorized instructions)\nINT+FP\nall     : 12%\nload    : 12%\nstore   : 12%\nmul     : 12%\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 12%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 2.00 cycles. At this rate:\n - 3% of peak load performance is reached (2.00 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 6% of peak store performance is reached (2.00 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 201d30\n\nInstruction                      | Nb FU | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2 | FP3 | Latency | Recip. throughput\n-------------------------------------------------------------------------------------------------------------------------------------------------\nCALL 202180 <@plt_start@+0x30>   | 6     | 1.25 | 1.25 | 1.25 | 1.25 | 0.50 | 0.50 | 0    | 0    | 0    | 0   | 0   | 0       | 1\nVCVTSI2SS %EAX,%XMM1,%XMM0       | 1     | 0    | 0    | 1    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 1   | 4       | 1\nVMULSS -0x1601(%RIP),%XMM0,%XMM0 | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0    | 0.50 | 0.50 | 0   | 0   | 3       | 0.50\nVMOVSS %XMM0,(%R14,%RBX,4)       | 1     | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0    | 0    | 1   | 0   | 1       | 1\nINC %RBX                         | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 1       | 0.25\nCMP %RBX,%R15                    | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 1       | 0.25\nJNE 201d30 <init_array+0x20>     | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 1       | 0.50\n",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "1% of peak computational performance is used (0.50 out of 48.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 2.00 to 1.00 cycles (2.00x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly:\nC storage order is row-major: for(i) for(j) a[j][i] = b[j][i]; (slow, non stride 1) => for(i) for(j) a[i][j] = b[i][j]; (fast, stride 1)\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "All SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is not vectorized.\n8 data elements could be processed at once in vector registers.\nBy vectorizing your loop, you can lower the cost of an iteration from 2.00 to 0.25 cycles (8.00x speedup).",
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
      "The loop is defined in /home/ahenches/Documents/isty/AOA/src/kernel.c:23-24.\n",
      "The related source loop is not unrolled or unrolled with no peel/tail loop.",
    },
    nb_paths = 1,
  },
}

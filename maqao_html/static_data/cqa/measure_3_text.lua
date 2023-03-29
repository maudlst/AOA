_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = "Pass to your compiler a micro-architecture specialization option:\n - Please read your compiler manual\n",
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - CVTSI2SS: 1 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = " - CVTSI2SS (INT32/64 to FP32, scalar): 1 occurrences\n - CVTSS2SD (FP32 to FP64, scalar): 1 occurrences\n",
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
          txt = "nb instructions    : 10\nnb uops            : 10\nloop length        : 39\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 2\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 1.67 cycles\nfront end            : 1.67 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | ALU0 | ALU1 | ALU2 | ALU3 | BRU  | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2  | FP3  | FP4  | FP5\n--------------------------------------------------------------------------------------------------------\nuops   | 0.50 | 0.50 | 1.00 | 0.50 | 0.50 | 0.67 | 0.67 | 0.67 | 0.00 | 0.00 | 2.00 | 2.00 | 0.50 | 0.50\ncycles | 0.50 | 0.50 | 1.00 | 0.50 | 0.50 | 0.67 | 0.67 | 0.67 | 0.00 | 0.00 | 2.00 | 2.00 | 0.50 | 0.50\n\nCycles executing div or sqrt instructions: NA\nCycles loading/storing data              : 1.00\nLongest recurrence chain latency (RecMII): 3.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 1.67\nDispatch  : 2.00\nData deps.: 3.00\nOverall L1: 3.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 33%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 33%\nFP\nall     : 0%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 0%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\nINT+FP\nall     : 14%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 0%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 25%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 29%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 29%\nFP\nall     : 15%\nload    : 12%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 18%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 12%\nINT+FP\nall     : 21%\nload    : 12%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 18%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 25%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 3.00 cycles. At this rate:\n - 1% of peak load performance is reached (1.33 out of 96.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 4% of peak store performance is reached (1.33 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 1590\n\nInstruction               | Nb FU | ALU0 | ALU1 | ALU2 | ALU3 | BRU  | AGU0 | AGU1 | AGU2 | FP0 | FP1 | FP2  | FP3  | FP4  | FP5  | Latency | Recip. throughput\n---------------------------------------------------------------------------------------------------------------------------------------------------------------\nMOV %EAX,%EDX             | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0    | 0    | 0    | 0    | 0       | 0.17\nPXOR %XMM0,%XMM0          | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0    | 0    | 0    | 0    | 0       | 0.25\nCVTSI2SS %RDX,%XMM0       | 2     | 0    | 0    | 1    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0.50 | 0.50 | 0    | 0    | 4       | 1\nADDSS (%R12,%RAX,4),%XMM0 | 1     | 0    | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0   | 0   | 0.50 | 0.50 | 0    | 0    | 3       | 0.50\nMOVSS %XMM0,(%RDI,%RAX,4) | 1     | 0    | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0   | 0   | 0    | 0    | 0.50 | 0.50 | 1       | 1\nADD $0x1,%RAX             | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0   | 0   | 0    | 0    | 0    | 0    | 1       | 0.25\nCVTSS2SD %XMM0,%XMM0      | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0.50 | 0.50 | 0    | 0    | 3       | 0.50\nADDSD %XMM0,%XMM1         | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0.50 | 0.50 | 0    | 0    | 3       | 0.50\nCMP %RAX,%RBX             | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0   | 0   | 0    | 0    | 0    | 0    | 1       | 0.25\nJNE 1590 <kernel+0x30>    | 1     | 0.50 | 0    | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0   | 0    | 0    | 0    | 0    | 1       | 0.50-1\n",
        },
      },
      header = {
        "1% of peak computational performance is used (0.67 out of 48.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is probably not vectorized.\nOnly 21% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 3.00 to 0.45 cycles (6.67x speedup).",
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
          workaround = "Pass to your compiler a micro-architecture specialization option:\n - Please read your compiler manual\n",
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - CVTSI2SS: 1 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = " - CVTSI2SS (INT32/64 to FP32, scalar): 1 occurrences\n - CVTSS2SD (FP32 to FP64, scalar): 1 occurrences\n",
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
          txt = "nb instructions    : 10\nnb uops            : 10\nloop length        : 39\nused x86 registers : 5\nused mmx registers : 0\nused xmm registers : 2\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 1.67 cycles\nfront end            : 1.67 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | ALU0 | ALU1 | ALU2 | ALU3 | BRU  | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2  | FP3  | FP4  | FP5\n--------------------------------------------------------------------------------------------------------\nuops   | 0.50 | 0.50 | 1.00 | 0.50 | 0.50 | 0.67 | 0.67 | 0.67 | 0.00 | 0.00 | 2.00 | 2.00 | 0.50 | 0.50\ncycles | 0.50 | 0.50 | 1.00 | 0.50 | 0.50 | 0.67 | 0.67 | 0.67 | 0.00 | 0.00 | 2.00 | 2.00 | 0.50 | 0.50\n\nCycles executing div or sqrt instructions: NA\nCycles loading/storing data              : 1.00\nLongest recurrence chain latency (RecMII): 3.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 1.67\nDispatch  : 2.00\nData deps.: 3.00\nOverall L1: 3.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 33%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 33%\nFP\nall     : 0%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 0%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 0%\nINT+FP\nall     : 14%\nload    : 0%\nstore   : 0%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 0%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 25%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 29%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 29%\nFP\nall     : 15%\nload    : 12%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 18%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 12%\nINT+FP\nall     : 21%\nload    : 12%\nstore   : 12%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : 18%\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 25%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 3.00 cycles. At this rate:\n - 1% of peak load performance is reached (1.33 out of 96.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 4% of peak store performance is reached (1.33 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 1590\n\nInstruction               | Nb FU | ALU0 | ALU1 | ALU2 | ALU3 | BRU  | AGU0 | AGU1 | AGU2 | FP0 | FP1 | FP2  | FP3  | FP4  | FP5  | Latency | Recip. throughput\n---------------------------------------------------------------------------------------------------------------------------------------------------------------\nMOV %EAX,%EDX             | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0    | 0    | 0    | 0    | 0       | 0.17\nPXOR %XMM0,%XMM0          | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0    | 0    | 0    | 0    | 0       | 0.25\nCVTSI2SS %RDX,%XMM0       | 2     | 0    | 0    | 1    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0.50 | 0.50 | 0    | 0    | 4       | 1\nADDSS (%R12,%RAX,4),%XMM0 | 1     | 0    | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0   | 0   | 0.50 | 0.50 | 0    | 0    | 3       | 0.50\nMOVSS %XMM0,(%RDI,%RAX,4) | 1     | 0    | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0   | 0   | 0    | 0    | 0.50 | 0.50 | 1       | 1\nADD $0x1,%RAX             | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0   | 0   | 0    | 0    | 0    | 0    | 1       | 0.25\nCVTSS2SD %XMM0,%XMM0      | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0.50 | 0.50 | 0    | 0    | 3       | 0.50\nADDSD %XMM0,%XMM1         | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0.50 | 0.50 | 0    | 0    | 3       | 0.50\nCMP %RAX,%RBX             | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0   | 0   | 0    | 0    | 0    | 0    | 1       | 0.25\nJNE 1590 <kernel+0x30>    | 1     | 0.50 | 0    | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0   | 0    | 0    | 0    | 0    | 1       | 0.50-1\n",
        },
      },
      header = {
        "1% of peak computational performance is used (0.67 out of 48.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try another compiler or update/tune your current one\n - Remove inter-iterations dependences from your loop and make it unit-stride:\n  * If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly\n  * If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is probably not vectorized.\nOnly 21% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 3.00 to 0.45 cycles (6.67x speedup).",
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
      "",
    },
    nb_paths = 1,
  },
}

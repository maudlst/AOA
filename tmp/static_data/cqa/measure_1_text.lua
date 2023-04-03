_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision. In C/C++, FP constants are double precision by default and must be suffixed by 'f' to make them single precision.",
          details = " - VCVTPD2PS (FP64 to FP32, SIMD): 2 occurrences\n - VCVTPS2PD (FP32 to FP64, SIMD): 2 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "2 AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 8 FP arithmetical operations:\n - 8: divide\nThe binary loop is loading 32 bytes (4 double precision FP elements).\nThe binary loop is storing 32 bytes (4 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 11\nnb uops            : 10\nloop length        : 47\nused x86 registers : 4\nused mmx registers : 0\nused xmm registers : 2\nused ymm registers : 3\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 1.67 cycles\nfront end            : 1.67 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2  | FP3\n-----------------------------------------------------------------------------------\nuops   | 0.50 | 0.50 | 0.50 | 0.50 | 1.33 | 1.33 | 1.33 | 0.00 | 0.00 | 2.00 | 6.00\ncycles | 0.50 | 0.50 | 0.50 | 0.50 | 1.33 | 1.33 | 1.33 | 0.00 | 0.00 | 2.00 | 6.00\n\nCycles executing div or sqrt instructions: 10.00-13.00\nCycles loading/storing data              : 2.00\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 1.67\nDispatch  : 6.00\nDIV/SQRT  : 10.00-13.00\nData deps.: 1.00\nOverall L1: 10.00-13.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 100%\nload    : 100%\nstore   : 100%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 100%\nother   : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 75%\nload    : 50%\nstore   : 50%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 100%\nother   : 75%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 13.00 cycles. At this rate:\n - 3% of peak load performance is reached (2.46 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 7% of peak store performance is reached (2.46 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 201c60\n\nInstruction                       | Nb FU | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0 | FP1 | FP2 | FP3 | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------------------------------\nVCVTPS2PD (%RAX,%RSI,1),%YMM2     | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0    | 0   | 0   | 0   | 1   | 3       | 1\nVCVTPS2PD 0x10(%RAX,%RSI,1),%YMM3 | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0    | 0   | 0   | 0   | 1   | 3       | 1\nVDIVPD %YMM1,%YMM3,%YMM3          | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 1   | 13      | 5-6.50\nVDIVPD %YMM1,%YMM2,%YMM2          | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 1   | 13      | 5-6.50\nVCVTPD2PS %YMM2,%XMM2             | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 1   | 3       | 1\nVCVTPD2PS %YMM3,%XMM3             | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 1   | 3       | 1\nVMOVUPD %XMM3,0x10(%RBX,%RSI,1)   | 1     | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0   | 0   | 1   | 0   | 4       | 1\nVMOVUPD %XMM2,(%RBX,%RSI,1)       | 1     | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0   | 0   | 1   | 0   | 4       | 1\nADD $0x20,%RSI                    | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.25\nCMP %RSI,%RDX                     | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.25\nJNE 201c60 <kernel+0x80>          | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.50\n",
        },
      },
      header = {
        "2% of peak computational performance is used (0.62 out of 24.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using 75% register length (average across all SSE/AVX instructions).\n",
        },
        {
          workaround = " - Reduce the number of division or square root instructions:\n  * If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n - Check whether you really need double precision. If not, switch to single precision to speedup execution\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of divide and square root operations (the divide/square root unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 13.00 to 6.00 cycles (2.17x speedup).\n",
        },
      },
      potential = {
        {
          title = "Expensive FP math instructions/calls",
          txt = "Detected performance impact from expensive FP math instructions/calls.\nBy removing/reexpressing them, you can lower the cost of an iteration from 13.00 to 4.00 cycles (3.25x speedup).",
        },
      },
    },
  },
  AVG = {
      hint = {
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision. In C/C++, FP constants are double precision by default and must be suffixed by 'f' to make them single precision.",
          details = " - VCVTPD2PS (FP64 to FP32, SIMD): 2 occurrences\n - VCVTPS2PD (FP32 to FP64, SIMD): 2 occurrences\n",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "2 AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 8 FP arithmetical operations:\n - 8: divide\nThe binary loop is loading 32 bytes (4 double precision FP elements).\nThe binary loop is storing 32 bytes (4 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "nb instructions    : 11\nnb uops            : 10\nloop length        : 47\nused x86 registers : 4\nused mmx registers : 0\nused xmm registers : 2\nused ymm registers : 3\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\nmicro-operation queue: 1.67 cycles\nfront end            : 1.67 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2  | FP3\n-----------------------------------------------------------------------------------\nuops   | 0.50 | 0.50 | 0.50 | 0.50 | 1.33 | 1.33 | 1.33 | 0.00 | 0.00 | 2.00 | 6.00\ncycles | 0.50 | 0.50 | 0.50 | 0.50 | 1.33 | 1.33 | 1.33 | 0.00 | 0.00 | 2.00 | 6.00\n\nCycles executing div or sqrt instructions: 10.00-13.00\nCycles loading/storing data              : 2.00\nLongest recurrence chain latency (RecMII): 1.00\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 1.67\nDispatch  : 6.00\nDIV/SQRT  : 10.00-13.00\nData deps.: 1.00\nOverall L1: 10.00-13.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 100%\nload    : 100%\nstore   : 100%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 100%\nother   : 100%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 75%\nload    : 50%\nstore   : 50%\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: 100%\nother   : 75%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 13.00 cycles. At this rate:\n - 3% of peak load performance is reached (2.46 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))\n - 7% of peak store performance is reached (2.46 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 201c60\n\nInstruction                       | Nb FU | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0 | FP1 | FP2 | FP3 | Latency | Recip. throughput\n------------------------------------------------------------------------------------------------------------------------------------------------\nVCVTPS2PD (%RAX,%RSI,1),%YMM2     | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0    | 0   | 0   | 0   | 1   | 3       | 1\nVCVTPS2PD 0x10(%RAX,%RSI,1),%YMM3 | 1     | 0    | 0    | 0    | 0    | 0.50 | 0.50 | 0    | 0   | 0   | 0   | 1   | 3       | 1\nVDIVPD %YMM1,%YMM3,%YMM3          | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 1   | 13      | 5-6.50\nVDIVPD %YMM1,%YMM2,%YMM2          | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 1   | 13      | 5-6.50\nVCVTPD2PS %YMM2,%XMM2             | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 1   | 3       | 1\nVCVTPD2PS %YMM3,%XMM3             | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 1   | 3       | 1\nVMOVUPD %XMM3,0x10(%RBX,%RSI,1)   | 1     | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0   | 0   | 1   | 0   | 4       | 1\nVMOVUPD %XMM2,(%RBX,%RSI,1)       | 1     | 0    | 0    | 0    | 0    | 0.33 | 0.33 | 0.33 | 0   | 0   | 1   | 0   | 4       | 1\nADD $0x20,%RSI                    | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.25\nCMP %RSI,%RDX                     | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.25\nJNE 201c60 <kernel+0x80>          | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 1       | 0.50\n",
        },
      },
      header = {
        "2% of peak computational performance is used (0.62 out of 24.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          details = "All SSE/AVX instructions are used in vector version (process two or more data elements in vector registers).\n",
          title = "Vectorization",
          txt = "Your loop is vectorized, but using 75% register length (average across all SSE/AVX instructions).\n",
        },
        {
          workaround = " - Reduce the number of division or square root instructions:\n  * If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.\n - Check whether you really need double precision. If not, switch to single precision to speedup execution\n",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of divide and square root operations (the divide/square root unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 13.00 to 6.00 cycles (2.17x speedup).\n",
        },
      },
      potential = {
        {
          title = "Expensive FP math instructions/calls",
          txt = "Detected performance impact from expensive FP math instructions/calls.\nBy removing/reexpressing them, you can lower the cost of an iteration from 13.00 to 4.00 cycles (3.25x speedup).",
        },
      },
    },
  common = {
    header = {
      "The loop is defined in /home/ahenches/Documents/isty/AOA/src/kernel.c:14-15.\n",
      "It is main loop of related source loop which is unrolled by 8 (including vectorization).",
    },
    nb_paths = 1,
  },
}

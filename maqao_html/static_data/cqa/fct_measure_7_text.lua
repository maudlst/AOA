_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - malloc@plt: 1 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
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
          txt = "nb instructions    : 25\nnb uops            : 30\nloop length        : 73\nused x86 registers : 9\nused mmx registers : 0\nused xmm registers : 1\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 5.00 cycles\nfront end            : 5.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | ALU0 | ALU1 | ALU2 | ALU3 | BRU  | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2  | FP3  | FP4  | FP5\n--------------------------------------------------------------------------------------------------------\nuops   | 1.50 | 1.50 | 1.25 | 1.25 | 1.50 | 0.33 | 0.33 | 0.33 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00\ncycles | 1.50 | 1.50 | 1.25 | 1.25 | 1.50 | 0.33 | 0.33 | 0.33 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 5.00\nDispatch  : 1.50\nOverall L1: 5.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 20%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 20%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 27%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 27%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 5.00 cycles. At this rate:\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 5.00 to 1.50 cycles (3.33x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 1560\n\nInstruction            | Nb FU | ALU0 | ALU1 | ALU2 | ALU3 | BRU  | AGU0 | AGU1 | AGU2 | FP0 | FP1 | FP2 | FP3 | FP4 | FP5 | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------------------------------------\nPUSH %R13              | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.50\nPUSH %R12              | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.50\nMOV %RDX,%R12          | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.17\nPUSH %RBP              | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.50\nMOV %RSI,%RBP          | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.17\nPUSH %RBX              | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.50\nMOV %EDI,%EBX          | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.17\nLEA (,%RBX,4),%RDI     | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.25\nSUB $0x8,%RSP          | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.25\nCALL 10a0 <malloc@plt> | 6     | 0.50 | 0    | 0    | 0    | 0.50 | 0.33 | 0.33 | 0.33 | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 1\nMOV %RAX,%RDI          | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.17\nTEST %EBX,%EBX         | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.25\nJE 15e0 <kernel+0x80>  | 1     | 0.50 | 0    | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.50-1\nXOR %EAX,%EAX          | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.25\nPXOR %XMM1,%XMM1       | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.25\nNOPL (%RAX)            | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.17\nXOR %EAX,%EAX          | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.25\nNOPL (%RAX)            | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.17\nADD $0x8,%RSP          | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.25\nPOP %RBX               | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.33\nPOP %RBP               | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.33\nPOP %R12               | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.33\nPOP %R13               | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.33\nJMP 1030 <free@plt>    | 1     | 0.50 | 0    | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 1\nNOP                    | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.17\n",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "0% of peak computational performance is used (0.00 out of 6.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 5.00 to 0.75 cycles (6.67x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is probably not vectorized.\nOnly 27% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 5.00 to 0.62 cycles (8.00x speedup).",
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
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - malloc@plt: 1 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
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
          txt = "nb instructions    : 25\nnb uops            : 30\nloop length        : 73\nused x86 registers : 9\nused mmx registers : 0\nused xmm registers : 1\nused ymm registers : 0\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 5.00 cycles\nfront end            : 5.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | ALU0 | ALU1 | ALU2 | ALU3 | BRU  | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2  | FP3  | FP4  | FP5\n--------------------------------------------------------------------------------------------------------\nuops   | 1.50 | 1.50 | 1.25 | 1.25 | 1.50 | 0.33 | 0.33 | 0.33 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00\ncycles | 1.50 | 1.50 | 1.25 | 1.25 | 1.50 | 0.33 | 0.33 | 0.33 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 5.00\nDispatch  : 1.50\nOverall L1: 5.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "all     : 20%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 20%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "all     : 27%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 27%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 5.00 cycles. At this rate:\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 5.00 to 1.50 cycles (3.33x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 1560\n\nInstruction            | Nb FU | ALU0 | ALU1 | ALU2 | ALU3 | BRU  | AGU0 | AGU1 | AGU2 | FP0 | FP1 | FP2 | FP3 | FP4 | FP5 | Latency | Recip. throughput\n--------------------------------------------------------------------------------------------------------------------------------------------------------\nPUSH %R13              | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.50\nPUSH %R12              | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.50\nMOV %RDX,%R12          | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.17\nPUSH %RBP              | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.50\nMOV %RSI,%RBP          | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.17\nPUSH %RBX              | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.50\nMOV %EDI,%EBX          | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.17\nLEA (,%RBX,4),%RDI     | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.25\nSUB $0x8,%RSP          | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.25\nCALL 10a0 <malloc@plt> | 6     | 0.50 | 0    | 0    | 0    | 0.50 | 0.33 | 0.33 | 0.33 | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 1\nMOV %RAX,%RDI          | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.17\nTEST %EBX,%EBX         | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.25\nJE 15e0 <kernel+0x80>  | 1     | 0.50 | 0    | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.50-1\nXOR %EAX,%EAX          | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.25\nPXOR %XMM1,%XMM1       | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.25\nNOPL (%RAX)            | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.17\nXOR %EAX,%EAX          | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.25\nNOPL (%RAX)            | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.17\nADD $0x8,%RSP          | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.25\nPOP %RBX               | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.33\nPOP %RBP               | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.33\nPOP %R12               | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.33\nPOP %R13               | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 1       | 0.33\nJMP 1030 <free@plt>    | 1     | 0.50 | 0    | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 1\nNOP                    | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0   | 0   | 0   | 0   | 0   | 0       | 0.17\n",
        },
      },
      header = {
        "Warnings:\nDetected a function call instruction: ignoring called function instructions.\nRerun with --follow-calls=append to include them to analysis  or with --follow-calls=inline to simulate inlining.",
        "0% of peak computational performance is used (0.00 out of 6.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = " - Try to reorganize arrays of structures to structures of arrays\n - Consider to permute loops (see vectorization gain report)\n",
          title = "Code clean check",
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 5.00 to 0.75 cycles (6.67x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is probably not vectorized.\nOnly 27% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 5.00 to 0.62 cycles (8.00x speedup).",
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
      "Warnings:\nIgnoring paths for analysis",
    },
  },
}

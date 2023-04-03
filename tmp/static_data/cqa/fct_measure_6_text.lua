_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - @plt_start@: 1 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - JMP: 3 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
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
          txt = "nb instructions    : 52\nnb uops            : 72\nloop length        : 166\nused x86 registers : 10\nused mmx registers : 0\nused xmm registers : 1\nused ymm registers : 1\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 12.00 cycles\nfront end            : 12.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2  | FP3\n-----------------------------------------------------------------------------------\nuops   | 6.75 | 6.75 | 6.75 | 6.75 | 0.50 | 0.50 | 0.00 | 0.00 | 1.00 | 1.00 | 0.00\ncycles | 6.75 | 6.75 | 6.75 | 6.75 | 0.50 | 0.50 | 0.00 | 0.00 | 1.00 | 1.00 | 0.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 12.00\nDispatch  : 6.75\nOverall L1: 12.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 4%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 4%\nFP\nall     : 33%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 33%\nINT+FP\nall     : 8%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 8%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 19%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 19%\nFP\nall     : 33%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 33%\nINT+FP\nall     : 21%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 21%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 12.00 cycles. At this rate:\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 12.00 to 6.75 cycles (1.78x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 201be0\n\nInstruction                    | Nb FU | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0 | FP1  | FP2  | FP3 | Latency | Recip. throughput\n-----------------------------------------------------------------------------------------------------------------------------------------------\nPUSH %RBP                      | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 1\nPUSH %R15                      | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 1\nPUSH %R14                      | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 1\nPUSH %RBX                      | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 1\nPUSH %RAX                      | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 1\nMOV %EDI,%EBP                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nMOV %EDI,%R15D                 | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nMOV %RDX,%R14                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nMOV %RSI,%RBX                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nLEA (,%RBP,4),%RDI             | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nCALL 202160 <@plt_start@+0x10> | 6     | 1.25 | 1.25 | 1.25 | 1.25 | 0.50 | 0.50 | 0    | 0   | 0    | 0    | 0   | 0       | 1\nTEST %R15D,%R15D               | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nJE 201cee <kernel+0x10e>       | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nVXORPS %XMM0,%XMM0,%XMM0       | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nXOR %ECX,%ECX                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nXCHG %AX,%AX                   | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nCMP $0x4,%R15D                 | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nJAE 201c3f <kernel+0x5f>       | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nXOR %ECX,%ECX                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nJMP 201cd0 <kernel+0xf0>       | 6     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 2\nCMP $0x8,%EBP                  | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nJAE 201c48 <kernel+0x68>       | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nXOR %ECX,%ECX                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nJMP 201c9a <kernel+0xba>       | 6     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 2\nVBROADCASTSD %XMM0,%YMM1       | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0.50 | 0.50 | 0   | 1       | 0.50\nMOV %RBP,%RDX                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nMOV %EBP,%ECX                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nXOR %ESI,%ESI                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nSHR $0x3,%RDX                  | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nAND $-0x8,%ECX                 | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nSAL $0x5,%RDX                  | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nNOP                            | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nCMP %RBP,%RCX                  | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nJE 201cee <kernel+0x10e>       | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nTEST $0x4,%BPL                 | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nJE 201cd0 <kernel+0xf0>        | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nVBROADCASTSD %XMM0,%YMM1       | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0.50 | 0.50 | 0   | 1       | 0.50\nMOV %RCX,%RDX                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nMOV %EBP,%ECX                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nAND $-0x4,%ECX                 | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nNOPW (%RAX,%RAX,1)             | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nCMP %RBP,%RCX                  | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nJE 201cee <kernel+0x10e>       | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nMOV %RAX,%RDI                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nADD $0x8,%RSP                  | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nPOP %RBX                       | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nPOP %R14                       | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nPOP %R15                       | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nPOP %RBP                       | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nVZEROUPPER                     | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nJMP 202170 <@plt_start@+0x20>  | 6     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 2\nNOPW %CS:(%RAX,%RAX,1)         | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\n",
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
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 12.00 to 3.00 cycles (4.00x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is probably not vectorized.\nOnly 21% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 12.00 to 1.76 cycles (6.82x speedup).",
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
          details = "Calling (and then returning from) a function prevents many compiler optimizations (like vectorization), breaks control flow (which reduces pipeline performance) and executes extra instructions to save/restore the registers used inside it, which is very expensive (dozens of cycles). Consider to inline small functions.\n - @plt_start@: 1 occurrences\n",
          title = "CALL instructions",
          txt = "Detected function call instructions.\n",
        },
        {
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n - JMP: 3 occurrences\n",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
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
          txt = "nb instructions    : 52\nnb uops            : 72\nloop length        : 166\nused x86 registers : 10\nused mmx registers : 0\nused xmm registers : 1\nused ymm registers : 1\nused zmm registers : 0\nnb stack references: 0\n",
        },
        {
          title = "Front-end",
          txt = "MACRO FUSION NOT POSSIBLE\nFIT IN UOP CACHE\nmicro-operation queue: 12.00 cycles\nfront end            : 12.00 cycles\n",
        },
        {
          title = "Back-end",
          txt = "       | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0  | FP1  | FP2  | FP3\n-----------------------------------------------------------------------------------\nuops   | 6.75 | 6.75 | 6.75 | 6.75 | 0.50 | 0.50 | 0.00 | 0.00 | 1.00 | 1.00 | 0.00\ncycles | 6.75 | 6.75 | 6.75 | 6.75 | 0.50 | 0.50 | 0.00 | 0.00 | 1.00 | 1.00 | 0.00\n\nCycles executing div or sqrt instructions: NA\n",
        },
        {
          title = "Cycles summary",
          txt = "Front-end : 12.00\nDispatch  : 6.75\nOverall L1: 12.00\n",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\nall    : 4%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 4%\nFP\nall     : 33%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 33%\nINT+FP\nall     : 8%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 8%\n",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\nall    : 19%\nload   : NA (no load vectorizable/vectorized instructions)\nstore  : NA (no store vectorizable/vectorized instructions)\nmul    : NA (no mul vectorizable/vectorized instructions)\nadd-sub: NA (no add-sub vectorizable/vectorized instructions)\nfma    : NA (no fma vectorizable/vectorized instructions)\nother  : 19%\nFP\nall     : 33%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 33%\nINT+FP\nall     : 21%\nload    : NA (no load vectorizable/vectorized instructions)\nstore   : NA (no store vectorizable/vectorized instructions)\nmul     : NA (no mul vectorizable/vectorized instructions)\nadd-sub : NA (no add-sub vectorizable/vectorized instructions)\nfma     : NA (no fma vectorizable/vectorized instructions)\ndiv/sqrt: NA (no div/sqrt vectorizable/vectorized instructions)\nother   : 21%\n",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each call to the function takes 12.00 cycles. At this rate:\n",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 12.00 to 6.75 cycles (1.78x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the function is: 201be0\n\nInstruction                    | Nb FU | ALU0 | ALU1 | ALU2 | ALU3 | AGU0 | AGU1 | AGU2 | FP0 | FP1  | FP2  | FP3 | Latency | Recip. throughput\n-----------------------------------------------------------------------------------------------------------------------------------------------\nPUSH %RBP                      | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 1\nPUSH %R15                      | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 1\nPUSH %R14                      | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 1\nPUSH %RBX                      | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 1\nPUSH %RAX                      | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 1\nMOV %EDI,%EBP                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nMOV %EDI,%R15D                 | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nMOV %RDX,%R14                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nMOV %RSI,%RBX                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nLEA (,%RBP,4),%RDI             | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nCALL 202160 <@plt_start@+0x10> | 6     | 1.25 | 1.25 | 1.25 | 1.25 | 0.50 | 0.50 | 0    | 0   | 0    | 0    | 0   | 0       | 1\nTEST %R15D,%R15D               | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nJE 201cee <kernel+0x10e>       | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nVXORPS %XMM0,%XMM0,%XMM0       | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nXOR %ECX,%ECX                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nXCHG %AX,%AX                   | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nCMP $0x4,%R15D                 | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nJAE 201c3f <kernel+0x5f>       | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nXOR %ECX,%ECX                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nJMP 201cd0 <kernel+0xf0>       | 6     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 2\nCMP $0x8,%EBP                  | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nJAE 201c48 <kernel+0x68>       | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nXOR %ECX,%ECX                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nJMP 201c9a <kernel+0xba>       | 6     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 2\nVBROADCASTSD %XMM0,%YMM1       | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0.50 | 0.50 | 0   | 1       | 0.50\nMOV %RBP,%RDX                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nMOV %EBP,%ECX                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nXOR %ESI,%ESI                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nSHR $0x3,%RDX                  | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nAND $-0x8,%ECX                 | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nSAL $0x5,%RDX                  | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nNOP                            | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nCMP %RBP,%RCX                  | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nJE 201cee <kernel+0x10e>       | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nTEST $0x4,%BPL                 | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nJE 201cd0 <kernel+0xf0>        | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nVBROADCASTSD %XMM0,%YMM1       | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0.50 | 0.50 | 0   | 1       | 0.50\nMOV %RCX,%RDX                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nMOV %EBP,%ECX                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nAND $-0x4,%ECX                 | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nNOPW (%RAX,%RAX,1)             | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nCMP %RBP,%RCX                  | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nJE 201cee <kernel+0x10e>       | 1     | 0.50 | 0    | 0    | 0.50 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nMOV %RAX,%RDI                  | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nADD $0x8,%RSP                  | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\nPOP %RBX                       | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nPOP %R14                       | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nPOP %R15                       | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nPOP %RBP                       | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.50\nVZEROUPPER                     | 1     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 0.25\nJMP 202170 <@plt_start@+0x20>  | 6     | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 0       | 2\nNOPW %CS:(%RAX,%RAX,1)         | 1     | 0.25 | 0.25 | 0.25 | 0.25 | 0    | 0    | 0    | 0   | 0    | 0    | 0   | 1       | 0.25\n",
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
          txt = "Detected a slowdown caused by scalar integer instructions (typically used for address computation).\nBy removing them, you can lower the cost of an iteration from 12.00 to 3.00 cycles (4.00x speedup).",
        },
        {
          workaround = " - Try another compiler or update/tune your current one\n - Make array accesses unit-stride:\n  * If your function streams arrays of structures (AoS), try to use structures of arrays instead (SoA):\nfor(i) a[i].x = b[i].x; (slow, non stride 1) => for(i) a.x[i] = b.x[i]; (fast, stride 1)\n",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized function can use their full power.\n",
          title = "Vectorization",
          txt = "Your function is probably not vectorized.\nOnly 21% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your function, you can lower the cost of an iteration from 12.00 to 1.76 cycles (6.82x speedup).",
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
      "The function is defined in /home/ahenches/Documents/isty/AOA/src/kernel.c:5-16.\n",
      "Warnings:\nIgnoring paths for analysis",
    },
  },
}

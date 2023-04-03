_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = "Recompile with march=broadwell.\nCQA target is Core_M5x (Intel Core M-5xxx Processor, 5th generation Intel Core processors based on Broadwell microarchitecture) but specialization flags are -march=x86-64",
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n<ul><li>CVTSI2SS: 1 occurrences</li><li>CVTSS2SD: 1 occurrences</li></ul>",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = "<ul><li>CVTSI2SS (INT32/64 to FP32, scalar): 1 occurrences</li><li>CVTSS2SD (FP32 to FP64, scalar): 1 occurrences</li></ul>",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "1 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n1 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 2 FP arithmetical operations:\n<ul><li>2: addition or subtraction</li></ul>The binary loop is loading 4 bytes (1 single precision FP elements).\nThe binary loop is storing 4 bytes (1 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.25 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>10</td></tr><tr><td>nb uops</td><td>12</td></tr><tr><td>loop length</td><td>39</td></tr><tr><td>used x86 registers</td><td>5</td></tr><tr><td>used mmx registers</td><td>0</td></tr><tr><td>used xmm registers</td><td>2</td></tr><tr><td>used ymm registers</td><td>0</td></tr><tr><td>used zmm registers</td><td>0</td></tr><tr><td>nb stack references</td><td>0</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\n<table><tr><td>micro-operation queue</td><td>3.00 cycles</td></tr><tr><td>front end</td><td>3.00 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th></tr><tr><td>uops</td><td>1.50</td><td>3.00</td><td>0.83</td><td>0.50</td><td>1.00</td><td>3.00</td><td>1.50</td><td>0.67</td></tr><tr><td>cycles</td><td>1.50</td><td>3.00</td><td>0.83</td><td>0.50</td><td>1.00</td><td>3.00</td><td>1.50</td><td>0.67</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>NA</td></tr><tr><td>Longest recurrence chain latency (RecMII)</td><td>3.00</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>3.00</td></tr><tr><td>Dispatch</td><td>3.00</td></tr><tr><td>Data deps.</td><td>3.00</td></tr><tr><td>Overall L1</td><td>3.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\n<table><tr><td>all</td><td>33%</td></tr><tr><td>load</td><td>NA (no load vectorizable/vectorized instructions)</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>33%</td></tr></table>FP\n<table><tr><td>all</td><td>0%</td></tr><tr><td>load</td><td>0%</td></tr><tr><td>store</td><td>0%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>0%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>NA (no div/sqrt vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>0%</td></tr></table>INT+FP\n<table><tr><td>all</td><td>14%</td></tr><tr><td>load</td><td>0%</td></tr><tr><td>store</td><td>0%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>0%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>NA (no div/sqrt vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>25%</td></tr></table>",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\n<table><tr><td>all</td><td>29%</td></tr><tr><td>load</td><td>NA (no load vectorizable/vectorized instructions)</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>29%</td></tr></table>FP\n<table><tr><td>all</td><td>15%</td></tr><tr><td>load</td><td>12%</td></tr><tr><td>store</td><td>12%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>18%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>NA (no div/sqrt vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>12%</td></tr></table>INT+FP\n<table><tr><td>all</td><td>21%</td></tr><tr><td>load</td><td>12%</td></tr><tr><td>store</td><td>12%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>18%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>NA (no div/sqrt vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>25%</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 3.00 cycles. At this rate:\n<ul><li>2% of peak load performance is reached (1.33 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))</li><li>4% of peak store performance is reached (1.33 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))</li></ul>",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 3.00 to 1.50 cycles (2.00x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 16b0\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>MOV %ECX,%EAX</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>PXOR %XMM0,%XMM0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>CVTSI2SS %RAX,%XMM0</td><td>3</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr><tr><td>ADDSS (%R12,%RCX,4),%XMM0</td><td>1</td><td>0</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSS %XMM0,(%RDI,%RCX,4)</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>0.33</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>3</td><td>1</td></tr><tr><td>ADD $0x1,%RCX</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>CVTSS2SD %XMM0,%XMM0</td><td>2</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>ADDSD %XMM0,%XMM1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>CMP %RCX,%RBX</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>JNE 16b0 <kernel+0x30></td><td>1</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0</td><td>0</td><td>0.50-1</td></tr></table>",
        },
      },
      header = {
        "2% of peak computational performance is used (0.67 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = "<ul><li>Try another compiler or update/tune your current one:\n<ul><li>recompile with ftree-vectorize (included in O3) to enable loop vectorization and with fassociative-math (included in Ofast or ffast-math) to extend vectorization to FP reductions.</li></ul></li><li>Remove inter-iterations dependences from your loop and make it unit-stride:\n<ul><li>If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly</li><li>If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)</li></ul></li></ul>",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is probably not vectorized.\nOnly 21% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 3.00 to 0.62 cycles (4.80x speedup).",
        },
        {
          workaround = "Reduce the number of FP add instructions",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of FP add operations (the FP add unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 3.00 to 1.50 cycles (2.00x speedup).\n",
        },
      },
      potential = {
      },
    },
  },
  AVG = {
      hint = {
        {
          workaround = "Recompile with march=broadwell.\nCQA target is Core_M5x (Intel Core M-5xxx Processor, 5th generation Intel Core processors based on Broadwell microarchitecture) but specialization flags are -march=x86-64",
          details = "These instructions generate more than one micro-operation and only one of them can be decoded during a cycle and the extra micro-operations increase pressure on execution units.\n<ul><li>CVTSI2SS: 1 occurrences</li><li>CVTSS2SD: 1 occurrences</li></ul>",
          title = "Complex instructions",
          txt = "Detected COMPLEX INSTRUCTIONS.\n",
        },
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision.",
          details = "<ul><li>CVTSI2SS (INT32/64 to FP32, scalar): 1 occurrences</li><li>CVTSS2SD (FP32 to FP64, scalar): 1 occurrences</li></ul>",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "1 SSE or AVX instructions are processing arithmetic or math operations on single precision FP elements in scalar mode (one at a time).\n1 SSE or AVX instructions are processing arithmetic or math operations on double precision FP elements in scalar mode (one at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 2 FP arithmetical operations:\n<ul><li>2: addition or subtraction</li></ul>The binary loop is loading 4 bytes (1 single precision FP elements).\nThe binary loop is storing 4 bytes (1 single precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.25 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>10</td></tr><tr><td>nb uops</td><td>12</td></tr><tr><td>loop length</td><td>39</td></tr><tr><td>used x86 registers</td><td>5</td></tr><tr><td>used mmx registers</td><td>0</td></tr><tr><td>used xmm registers</td><td>2</td></tr><tr><td>used ymm registers</td><td>0</td></tr><tr><td>used zmm registers</td><td>0</td></tr><tr><td>nb stack references</td><td>0</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\n<table><tr><td>micro-operation queue</td><td>3.00 cycles</td></tr><tr><td>front end</td><td>3.00 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th></tr><tr><td>uops</td><td>1.50</td><td>3.00</td><td>0.83</td><td>0.50</td><td>1.00</td><td>3.00</td><td>1.50</td><td>0.67</td></tr><tr><td>cycles</td><td>1.50</td><td>3.00</td><td>0.83</td><td>0.50</td><td>1.00</td><td>3.00</td><td>1.50</td><td>0.67</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>NA</td></tr><tr><td>Longest recurrence chain latency (RecMII)</td><td>3.00</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>3.00</td></tr><tr><td>Dispatch</td><td>3.00</td></tr><tr><td>Data deps.</td><td>3.00</td></tr><tr><td>Overall L1</td><td>3.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "INT\n<table><tr><td>all</td><td>33%</td></tr><tr><td>load</td><td>NA (no load vectorizable/vectorized instructions)</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>33%</td></tr></table>FP\n<table><tr><td>all</td><td>0%</td></tr><tr><td>load</td><td>0%</td></tr><tr><td>store</td><td>0%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>0%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>NA (no div/sqrt vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>0%</td></tr></table>INT+FP\n<table><tr><td>all</td><td>14%</td></tr><tr><td>load</td><td>0%</td></tr><tr><td>store</td><td>0%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>0%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>NA (no div/sqrt vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>25%</td></tr></table>",
        },
        {
          title = "Vector efficiency ratios",
          txt = "INT\n<table><tr><td>all</td><td>29%</td></tr><tr><td>load</td><td>NA (no load vectorizable/vectorized instructions)</td></tr><tr><td>store</td><td>NA (no store vectorizable/vectorized instructions)</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>29%</td></tr></table>FP\n<table><tr><td>all</td><td>15%</td></tr><tr><td>load</td><td>12%</td></tr><tr><td>store</td><td>12%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>18%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>NA (no div/sqrt vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>12%</td></tr></table>INT+FP\n<table><tr><td>all</td><td>21%</td></tr><tr><td>load</td><td>12%</td></tr><tr><td>store</td><td>12%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>18%</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>NA (no div/sqrt vectorizable/vectorized instructions)</td></tr><tr><td>other</td><td>25%</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 3.00 cycles. At this rate:\n<ul><li>2% of peak load performance is reached (1.33 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))</li><li>4% of peak store performance is reached (1.33 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))</li></ul>",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Performance is limited by instruction throughput (loading/decoding program instructions to execution core) (front-end is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 3.00 to 1.50 cycles (2.00x speedup).\n",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 16b0\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>P0</th><th>P1</th><th>P2</th><th>P3</th><th>P4</th><th>P5</th><th>P6</th><th>P7</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>MOV %ECX,%EAX</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>PXOR %XMM0,%XMM0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.25</td></tr><tr><td>CVTSI2SS %RAX,%XMM0</td><td>3</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>2</td><td>0</td><td>0</td><td>0</td><td>2</td></tr><tr><td>ADDSS (%R12,%RCX,4),%XMM0</td><td>1</td><td>0</td><td>1</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>MOVSS %XMM0,(%RDI,%RCX,4)</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>0.33</td><td>1</td><td>0</td><td>0</td><td>0.33</td><td>3</td><td>1</td></tr><tr><td>ADD $0x1,%RCX</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>CVTSS2SD %XMM0,%XMM0</td><td>2</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>2</td><td>1</td></tr><tr><td>ADDSD %XMM0,%XMM1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>3</td><td>1</td></tr><tr><td>CMP %RCX,%RBX</td><td>1</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0.25</td><td>0.25</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>JNE 16b0 <kernel+0x30></td><td>1</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0</td><td>0</td><td>0.50-1</td></tr></table>",
        },
      },
      header = {
        "2% of peak computational performance is used (0.67 out of 32.00 FLOP per cycle (GFLOPS @ 1GHz))",
      },
      brief = {
      },
      gain = {
        {
          workaround = "<ul><li>Try another compiler or update/tune your current one:\n<ul><li>recompile with ftree-vectorize (included in O3) to enable loop vectorization and with fassociative-math (included in Ofast or ffast-math) to extend vectorization to FP reductions.</li></ul></li><li>Remove inter-iterations dependences from your loop and make it unit-stride:\n<ul><li>If your arrays have 2 or more dimensions, check whether elements are accessed contiguously and, otherwise, try to permute loops accordingly</li><li>If your loop streams arrays of structures (AoS), try to use structures of arrays instead (SoA)</li></ul></li></ul>",
          details = "Store and arithmetical SSE/AVX instructions are used in scalar version (process only one data element in vector registers).\nSince your execution units are vector units, only a vectorized loop can use their full power.\n",
          title = "Vectorization",
          txt = "Your loop is probably not vectorized.\nOnly 21% of vector register length is used (average across all SSE/AVX instructions).\nBy vectorizing your loop, you can lower the cost of an iteration from 3.00 to 0.62 cycles (4.80x speedup).",
        },
        {
          workaround = "Reduce the number of FP add instructions",
          title = "Execution units bottlenecks",
          txt = "Performance is limited by execution of FP add operations (the FP add unit is a bottleneck).\n\nBy removing all these bottlenecks, you can lower the cost of an iteration from 3.00 to 1.50 cycles (2.00x speedup).\n",
        },
      },
      potential = {
      },
    },
  common = {
    header = {
      "The loop is defined in /home/paul/Bureau/iatic4/sem2/aoa/code/AOA/src/kernel.c:9-12.\n",
      "The related source loop is not unrolled or unrolled with no peel/tail loop.",
    },
    nb_paths = 1,
  },
}

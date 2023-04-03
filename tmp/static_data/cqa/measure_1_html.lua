_cqa_text_report = {
  paths = {
    {
      hint = {
        {
          workaround = "Avoid mixing data with different types. In particular, check if the type of constants is the same as array elements. Use double instead of single precision only when/where needed by numerical stability and avoid mixing precision. In C/C++, FP constants are double precision by default and must be suffixed by 'f' to make them single precision.",
          details = "<ul><li>VCVTPD2PS (FP64 to FP32, SIMD): 2 occurrences</li><li>VCVTPS2PD (FP32 to FP64, SIMD): 2 occurrences</li></ul>",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "2 AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 8 FP arithmetical operations:\n<ul><li>8: divide</li></ul>The binary loop is loading 32 bytes (4 double precision FP elements).\nThe binary loop is storing 32 bytes (4 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>11</td></tr><tr><td>nb uops</td><td>10</td></tr><tr><td>loop length</td><td>47</td></tr><tr><td>used x86 registers</td><td>4</td></tr><tr><td>used mmx registers</td><td>0</td></tr><tr><td>used xmm registers</td><td>2</td></tr><tr><td>used ymm registers</td><td>3</td></tr><tr><td>used zmm registers</td><td>0</td></tr><tr><td>nb stack references</td><td>0</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\n<table><tr><td>micro-operation queue</td><td>1.67 cycles</td></tr><tr><td>front end</td><td>1.67 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>ALU0</th><th>ALU1</th><th>ALU2</th><th>ALU3</th><th>AGU0</th><th>AGU1</th><th>AGU2</th><th>FP0</th><th>FP1</th><th>FP2</th><th>FP3</th></tr><tr><td>uops</td><td>0.50</td><td>0.50</td><td>0.50</td><td>0.50</td><td>1.33</td><td>1.33</td><td>1.33</td><td>0.00</td><td>0.00</td><td>2.00</td><td>6.00</td></tr><tr><td>cycles</td><td>0.50</td><td>0.50</td><td>0.50</td><td>0.50</td><td>1.33</td><td>1.33</td><td>1.33</td><td>0.00</td><td>0.00</td><td>2.00</td><td>6.00</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>10.00-13.00</td></tr><tr><td>Cycles loading/storing data</td><td>2.00</td></tr><tr><td>Longest recurrence chain latency (RecMII)</td><td>1.00</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>1.67</td></tr><tr><td>Dispatch</td><td>6.00</td></tr><tr><td>DIV/SQRT</td><td>10.00-13.00</td></tr><tr><td>Data deps.</td><td>1.00</td></tr><tr><td>Overall L1</td><td>10.00-13.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "<table><tr><td>all</td><td>100%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>100%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>100%</td></tr></table>",
        },
        {
          title = "Vector efficiency ratios",
          txt = "<table><tr><td>all</td><td>75%</td></tr><tr><td>load</td><td>50%</td></tr><tr><td>store</td><td>50%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>75%</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 13.00 cycles. At this rate:\n<ul><li>3% of peak load performance is reached (2.46 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))</li><li>7% of peak store performance is reached (2.46 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))</li></ul>",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 201c60\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>ALU0</th><th>ALU1</th><th>ALU2</th><th>ALU3</th><th>AGU0</th><th>AGU1</th><th>AGU2</th><th>FP0</th><th>FP1</th><th>FP2</th><th>FP3</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>VCVTPS2PD (%RAX,%RSI,1),%YMM2</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>3</td><td>1</td></tr><tr><td>VCVTPS2PD 0x10(%RAX,%RSI,1),%YMM3</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>3</td><td>1</td></tr><tr><td>VDIVPD %YMM1,%YMM3,%YMM3</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>13</td><td>5-6.50</td></tr><tr><td>VDIVPD %YMM1,%YMM2,%YMM2</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>13</td><td>5-6.50</td></tr><tr><td>VCVTPD2PS %YMM2,%XMM2</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>3</td><td>1</td></tr><tr><td>VCVTPD2PS %YMM3,%XMM3</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>3</td><td>1</td></tr><tr><td>VMOVUPD %XMM3,0x10(%RBX,%RSI,1)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>1</td><td>0</td><td>4</td><td>1</td></tr><tr><td>VMOVUPD %XMM2,(%RBX,%RSI,1)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>1</td><td>0</td><td>4</td><td>1</td></tr><tr><td>ADD $0x20,%RSI</td><td>1</td><td>0.25</td><td>0.25</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>CMP %RSI,%RDX</td><td>1</td><td>0.25</td><td>0.25</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>JNE 201c60 <kernel+0x80></td><td>1</td><td>0.50</td><td>0</td><td>0</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr></table>",
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
          workaround = "<ul><li>Reduce the number of division or square root instructions:\n<ul><li>If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.</li></ul></li><li>Check whether you really need double precision. If not, switch to single precision to speedup execution</li></ul>",
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
          details = "<ul><li>VCVTPD2PS (FP64 to FP32, SIMD): 2 occurrences</li><li>VCVTPS2PD (FP32 to FP64, SIMD): 2 occurrences</li></ul>",
          title = "Conversion instructions",
          txt = "Detected expensive conversion instructions.",
        },
        {
          title = "Type of elements and instruction set",
          txt = "2 AVX instructions are processing arithmetic or math operations on double precision FP elements in vector mode (four at a time).\n",
        },
        {
          title = "Matching between your loop (in the source code) and the binary loop",
          txt = "The binary loop is composed of 8 FP arithmetical operations:\n<ul><li>8: divide</li></ul>The binary loop is loading 32 bytes (4 double precision FP elements).\nThe binary loop is storing 32 bytes (4 double precision FP elements).",
        },
        {
          title = "Arithmetic intensity",
          txt = "Arithmetic intensity is 0.12 FP operations per loaded or stored byte.",
        },
      },
      expert = {
        {
          title = "General properties",
          txt = "<table><tr><td>nb instructions</td><td>11</td></tr><tr><td>nb uops</td><td>10</td></tr><tr><td>loop length</td><td>47</td></tr><tr><td>used x86 registers</td><td>4</td></tr><tr><td>used mmx registers</td><td>0</td></tr><tr><td>used xmm registers</td><td>2</td></tr><tr><td>used ymm registers</td><td>3</td></tr><tr><td>used zmm registers</td><td>0</td></tr><tr><td>nb stack references</td><td>0</td></tr></table>",
        },
        {
          title = "Front-end",
          txt = "ASSUMED MACRO FUSION\nFIT IN UOP CACHE\n<table><tr><td>micro-operation queue</td><td>1.67 cycles</td></tr><tr><td>front end</td><td>1.67 cycles</td></tr></table>",
        },
        {
          title = "Back-end",
          txt = "<table><tr><th>      </th><th>ALU0</th><th>ALU1</th><th>ALU2</th><th>ALU3</th><th>AGU0</th><th>AGU1</th><th>AGU2</th><th>FP0</th><th>FP1</th><th>FP2</th><th>FP3</th></tr><tr><td>uops</td><td>0.50</td><td>0.50</td><td>0.50</td><td>0.50</td><td>1.33</td><td>1.33</td><td>1.33</td><td>0.00</td><td>0.00</td><td>2.00</td><td>6.00</td></tr><tr><td>cycles</td><td>0.50</td><td>0.50</td><td>0.50</td><td>0.50</td><td>1.33</td><td>1.33</td><td>1.33</td><td>0.00</td><td>0.00</td><td>2.00</td><td>6.00</td></tr></table>\n<table><tr><td>Cycles executing div or sqrt instructions</td><td>10.00-13.00</td></tr><tr><td>Cycles loading/storing data</td><td>2.00</td></tr><tr><td>Longest recurrence chain latency (RecMII)</td><td>1.00</td></tr></table>",
        },
        {
          title = "Cycles summary",
          txt = "<table><tr><td>Front-end</td><td>1.67</td></tr><tr><td>Dispatch</td><td>6.00</td></tr><tr><td>DIV/SQRT</td><td>10.00-13.00</td></tr><tr><td>Data deps.</td><td>1.00</td></tr><tr><td>Overall L1</td><td>10.00-13.00</td></tr></table>",
        },
        {
          title = "Vectorization ratios",
          txt = "<table><tr><td>all</td><td>100%</td></tr><tr><td>load</td><td>100%</td></tr><tr><td>store</td><td>100%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>100%</td></tr></table>",
        },
        {
          title = "Vector efficiency ratios",
          txt = "<table><tr><td>all</td><td>75%</td></tr><tr><td>load</td><td>50%</td></tr><tr><td>store</td><td>50%</td></tr><tr><td>mul</td><td>NA (no mul vectorizable/vectorized instructions)</td></tr><tr><td>add-sub</td><td>NA (no add-sub vectorizable/vectorized instructions)</td></tr><tr><td>fma</td><td>NA (no fma vectorizable/vectorized instructions)</td></tr><tr><td>div/sqrt</td><td>100%</td></tr><tr><td>other</td><td>75%</td></tr></table>",
        },
        {
          title = "Cycles and memory resources usage",
          txt = "Assuming all data fit into the L1 cache, each iteration of the binary loop takes 13.00 cycles. At this rate:\n<ul><li>3% of peak load performance is reached (2.46 out of 64.00 bytes loaded per cycle (GB/s @ 1GHz))</li><li>7% of peak store performance is reached (2.46 out of 32.00 bytes stored per cycle (GB/s @ 1GHz))</li></ul>",
        },
        {
          title = "Front-end bottlenecks",
          txt = "Found no such bottlenecks.",
        },
        {
          title = "ASM code",
          txt = "In the binary file, the address of the loop is: 201c60\n\n<table><tr><th>Instruction</th><th>Nb FU</th><th>ALU0</th><th>ALU1</th><th>ALU2</th><th>ALU3</th><th>AGU0</th><th>AGU1</th><th>AGU2</th><th>FP0</th><th>FP1</th><th>FP2</th><th>FP3</th><th>Latency</th><th>Recip. throughput</th></tr><tr><td>VCVTPS2PD (%RAX,%RSI,1),%YMM2</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>3</td><td>1</td></tr><tr><td>VCVTPS2PD 0x10(%RAX,%RSI,1),%YMM3</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.50</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>3</td><td>1</td></tr><tr><td>VDIVPD %YMM1,%YMM3,%YMM3</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>13</td><td>5-6.50</td></tr><tr><td>VDIVPD %YMM1,%YMM2,%YMM2</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>13</td><td>5-6.50</td></tr><tr><td>VCVTPD2PS %YMM2,%XMM2</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>3</td><td>1</td></tr><tr><td>VCVTPD2PS %YMM3,%XMM3</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>3</td><td>1</td></tr><tr><td>VMOVUPD %XMM3,0x10(%RBX,%RSI,1)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>1</td><td>0</td><td>4</td><td>1</td></tr><tr><td>VMOVUPD %XMM2,(%RBX,%RSI,1)</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0.33</td><td>0.33</td><td>0.33</td><td>0</td><td>0</td><td>1</td><td>0</td><td>4</td><td>1</td></tr><tr><td>ADD $0x20,%RSI</td><td>1</td><td>0.25</td><td>0.25</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>CMP %RSI,%RDX</td><td>1</td><td>0.25</td><td>0.25</td><td>0.25</td><td>0.25</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.25</td></tr><tr><td>JNE 201c60 <kernel+0x80></td><td>1</td><td>0.50</td><td>0</td><td>0</td><td>0.50</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0.50</td></tr></table>",
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
          workaround = "<ul><li>Reduce the number of division or square root instructions:\n<ul><li>If denominator is constant over iterations, use reciprocal (replace x/y with x*(1/y)). Check precision impact.</li></ul></li><li>Check whether you really need double precision. If not, switch to single precision to speedup execution</li></ul>",
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

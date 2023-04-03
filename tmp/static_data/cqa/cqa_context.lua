_cqa_uarch_const = {
  ["RS_ALU2 size"] = 16,
  ["ports"] = {
    ["FP ADD"] = {
      [1] = 9,
      [2] = 10,
    },
    ["store address"] = {
      [1] = 4,
      [2] = 5,
      [3] = 6,
    },
    ["FP store data"] = {
      [1] = 9,
    },
    ["DIV/SQRT"] = {
      [1] = 10,
    },
    ["load"] = {
      [1] = 4,
      [2] = 5,
    },
    ["misc"] = {
      [1] = 0,
      [2] = 1,
      [3] = 2,
      [4] = 3,
    },
    ["VPU"] = {
      [1] = 7,
      [2] = 8,
      [3] = 9,
      [4] = 10,
    },
    ["FP FMA"] = {
      [1] = 7,
      [2] = 8,
    },
    ["FP MUL"] = {
      [1] = 7,
      [2] = 8,
    },
  },
  ["load unit native width"] = 32,
  ["RS_ALU1 size"] = 16,
  ["RS_MEM size"] = 92,
  ["LFB size"] = 22,
  ["RS_ALU0 size"] = 16,
  ["predicted taken branch ports"] = {
    [1] = 0,
  },
  ["ROB size"] = 224,
  ["INT vector size in bytes"] = 32,
  ["vector size in bytes"] = 32,
  ["aliases"] = {
    ["RS_ALU0"] = "ALQ0",
    ["RS_ALU2"] = "ALQ2",
    ["RS_VPU"] = "SQ",
    ["RS_ALU1"] = "ALQ1",
    ["LFB"] = "MAB",
    ["SB"] = "STQ",
    ["RS_ALU3"] = "ALQ3",
    ["ROB"] = "RQ",
    ["RS_MEM"] = "AGQ",
    ["LB"] = "LDQ",
  },
  ["RS_ALU3 size"] = 16,
  ["store unit native width"] = 32,
  ["UQ throughput"] = 6,
  ["PRF_INT size"] = 180,
  ["IQ throughput"] = 4,
  ["PRF_FLOAT size"] = 160,
  ["uop cache capacity"] = 2600,
  ["store latency"] = 3,
  ["load latency"] = 4,
  ["NOP 0f 1f decode"] = "fast",
  ["retire throughput"] = 8,
  ["SB size"] = 48,
  ["LB size"] = 44,
  ["FP DIV/SQRT unit native width"] = 32,
  ["RS_VPU size"] = 36,
  ["UFS resources"] = {
    [1] = "ROB",
    [2] = "RS_ALU0",
    [3] = "RS_ALU1",
    [4] = "RS_ALU2",
    [5] = "RS_ALU3",
    [6] = "RS_VPU",
    [7] = "RS_MEM",
    [8] = "LB",
    [9] = "LFB",
    [10] = "SB",
    [11] = "PRF_INT",
    [12] = "PRF_FLOAT",
  },
  ["bytes fetched per cycle"] = 32,
  ["FP load latency"] = 7,
  ["nb execution ports"] = 11,
  ["vector-unaligned optimal pattern"] = "1x256",
}

#!/usr/bin/env bash
set -euo pipefail

# 下方(来源)与上方(目标)文件夹路径，按你的实际路径改一下：
SRC="12_eval_uniad_0.6s_bc_b2d_traj"
DST="12_eval_uniad_0.6s_1_b2d_traj"

mkdir -p "$DST"

for i in 0 1 2 3; do
  src_file="${SRC}/eval_bench2drive220_${i}.json"
  new_idx=$((i + 8))  # 0→8, 1→9, 2→10, 3→11, 4→12, 5→13, 6→14, 7→15
  dst_file="${DST}/eval_bench2drive220_${new_idx}.json"

  if [[ -f "$src_file" ]]; then
    cp -f "$src_file" "$dst_file"
    echo "Copied: $src_file  ->  $dst_file"
  else
    echo "WARN: not found $src_file" >&2
  fi
done

echo "Done."
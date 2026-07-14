#!/usr/bin/env bash
# 하위 레포 일괄 클론 — 새 장비에서 메타 레포만 받은 뒤 실행 (재실행 안전)
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

REPOS=(
    # "https://github.example.com/org/repo-1.git"
)

for url in "${REPOS[@]}"; do
    dir=$(basename "$url" .git)
    if [[ -d "$dir" ]]; then
        echo "skip (이미 있음): $dir"
    else
        git clone "$url" "$dir"
    fi
done

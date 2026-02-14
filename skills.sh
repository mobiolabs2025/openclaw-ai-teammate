#!/bin/bash
# Agent Platform - 스킬 목록 조회
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/common.sh"

echo "🧩 사용 가능한 스킬"
echo "---"

response=$(api_call GET "/skills")

if command -v jq &> /dev/null; then
    echo "$response" | jq -r '.skills[] | "\(.emoji) \(.name) \(if .included then "[기본 포함]" else "" end)"'
else
    echo "$response"
fi

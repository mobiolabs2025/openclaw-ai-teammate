#!/bin/bash
# Agent Platform - 에이전트와 채팅
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/common.sh"

usage() {
    echo "Usage: $0 <agent_id> <message>"
    echo ""
    echo "Examples:"
    echo "  $0 agent_1 '안녕하세요'"
    echo "  $0 agent_2 '코드 리뷰해줘'"
    exit 1
}

agent_id="$1"
message="$2"

[ -z "$agent_id" ] && usage
[ -z "$message" ] && usage

# 채팅 요청
data=$(cat <<EOF
{
    "agent_id": "$agent_id",
    "content": "$message"
}
EOF
)

echo "💬 $agent_id 에게 메시지 전송..."
echo "---"
response=$(api_call POST "/chat" "$data")

if command -v jq &> /dev/null; then
    content=$(echo "$response" | jq -r '.content')
    timestamp=$(echo "$response" | jq -r '.timestamp')
    echo "🤖 응답:"
    echo "$content"
    echo ""
    echo "⏱️ $timestamp"
else
    echo "$response"
fi

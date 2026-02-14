#!/bin/bash
# Agent Platform - 에이전트 관리
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/common.sh"

usage() {
    echo "Usage: $0 <command> [options]"
    echo ""
    echo "Commands:"
    echo "  list              에이전트 목록 조회"
    echo "  get <id>          에이전트 상세 조회"
    echo "  create [options]  에이전트 생성"
    echo "  delete <id>       에이전트 삭제"
    echo ""
    echo "Create options:"
    echo "  --name <name>           에이전트 이름 (필수)"
    echo "  --desc <description>    설명"
    echo "  --personality <type>    성격 (professional|friendly|concise|detailed)"
    echo "  --skills <list>         스킬 (쉼표 구분: core,search,finance)"
    exit 1
}

cmd_list() {
    echo "📋 에이전트 목록"
    echo "---"
    local response=$(api_call GET "/agents")
    
    if command -v jq &> /dev/null; then
        echo "$response" | jq -r '.[] | "[\(.status)] \(.name) (ID: \(.id)) - Users: \(.user_count), Messages: \(.message_count)"'
    else
        echo "$response"
    fi
}

cmd_get() {
    local agent_id="$1"
    [ -z "$agent_id" ] && { echo "Error: agent_id required"; exit 1; }
    
    echo "🤖 에이전트 상세: $agent_id"
    echo "---"
    local response=$(api_call GET "/agents/$agent_id")
    
    if command -v jq &> /dev/null; then
        echo "$response" | jq '.'
    else
        echo "$response"
    fi
}

cmd_create() {
    local name=""
    local desc=""
    local personality="professional"
    local skills="core"
    
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --name) name="$2"; shift 2 ;;
            --desc) desc="$2"; shift 2 ;;
            --personality) personality="$2"; shift 2 ;;
            --skills) skills="$2"; shift 2 ;;
            *) shift ;;
        esac
    done
    
    [ -z "$name" ] && { echo "Error: --name required"; exit 1; }
    
    # skills를 JSON 배열로 변환
    local skills_json=$(echo "$skills" | tr ',' '\n' | sed 's/^/"/;s/$/"/' | tr '\n' ',' | sed 's/,$//')
    
    local data=$(cat <<EOF
{
    "name": "$name",
    "description": "$desc",
    "personality": "$personality",
    "skills": [$skills_json]
}
EOF
)
    
    echo "✨ 에이전트 생성 중..."
    local response=$(api_call POST "/agents" "$data")
    
    if command -v jq &> /dev/null; then
        local new_id=$(echo "$response" | jq -r '.id')
        echo "✅ 생성 완료: $name (ID: $new_id)"
        echo "$response" | jq '.'
    else
        echo "$response"
    fi
}

cmd_delete() {
    local agent_id="$1"
    [ -z "$agent_id" ] && { echo "Error: agent_id required"; exit 1; }
    
    echo "🗑️ 에이전트 삭제: $agent_id"
    local response=$(api_call DELETE "/agents/$agent_id")
    echo "$response"
}

# 메인
case "${1:-}" in
    list) cmd_list ;;
    get) cmd_get "$2" ;;
    create) shift; cmd_create "$@" ;;
    delete) cmd_delete "$2" ;;
    *) usage ;;
esac

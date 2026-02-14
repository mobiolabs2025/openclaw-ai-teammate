#!/bin/bash
# Agent Platform - 관리자 기능
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/common.sh"

usage() {
    echo "Usage: $0 <command>"
    echo ""
    echo "Commands:"
    echo "  stats    통계 조회"
    echo "  logs     최근 로그"
    echo "  health   헬스 체크"
    exit 1
}

cmd_stats() {
    echo "📊 Agent Platform 통계"
    echo "---"
    response=$(api_call GET "/admin/stats")
    
    if command -v jq &> /dev/null; then
        echo "$response" | jq -r '"총 에이전트: \(.total_agents)\n활성 에이전트: \(.active_agents)\n총 사용자: \(.total_users)\n총 메시지: \(.total_messages)\n평균 응답시간: \(.avg_response_time)"'
    else
        echo "$response"
    fi
}

cmd_logs() {
    echo "📜 최근 로그"
    echo "---"
    response=$(api_call GET "/admin/logs?limit=10")
    
    if command -v jq &> /dev/null; then
        echo "$response" | jq -r '.logs[] | "[\(.time)] [\(.level)] \(.message)"'
    else
        echo "$response"
    fi
}

cmd_health() {
    echo "🏥 헬스 체크"
    echo "---"
    response=$(api_call GET "/health")
    
    if command -v jq &> /dev/null; then
        echo "$response" | jq '.'
    else
        echo "$response"
    fi
}

case "${1:-}" in
    stats) cmd_stats ;;
    logs) cmd_logs ;;
    health) cmd_health ;;
    *) usage ;;
esac

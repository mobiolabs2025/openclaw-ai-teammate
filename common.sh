#!/bin/bash
# AI Teammate OpenClaw Skill - Common functions

# Load .env if exists
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$SCRIPT_DIR/.env" ]; then
    export $(grep -v '^#' "$SCRIPT_DIR/.env" | xargs)
fi

# Configuration
AI_TEAMMATE_URL="${AI_TEAMMATE_URL:-https://agent.mobiolabs.net}"
AI_TEAMMATE_API_KEY="${AI_TEAMMATE_API_KEY:-}"

# API call function
api_call() {
    local method="$1"
    local endpoint="$2"
    local data="$3"
    
    local url="${AI_TEAMMATE_URL}/api${endpoint}"
    local headers=(-H "Content-Type: application/json")
    
    if [ -n "$AI_TEAMMATE_API_KEY" ]; then
        headers+=(-H "Authorization: Bearer $AI_TEAMMATE_API_KEY")
    fi
    
    if [ "$method" = "GET" ]; then
        curl -s "${headers[@]}" "$url"
    else
        curl -s -X "$method" "${headers[@]}" -d "$data" "$url"
    fi
}

# Check if jq is available
has_jq() {
    command -v jq &> /dev/null
}

# Pretty print JSON
pretty_json() {
    if has_jq; then
        jq '.'
    else
        cat
    fi
}

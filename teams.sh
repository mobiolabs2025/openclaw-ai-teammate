#!/bin/bash
# AI Teammate Teams CLI

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/.env" 2>/dev/null || true

API_URL="${MOBIO_AGENT_URL:-https://agent.mobiolabs.net}"
API_KEY="${MOBIO_AGENT_API_KEY:-}"

if [ -z "$API_KEY" ]; then
  echo "Error: MOBIO_AGENT_API_KEY not set"
  exit 1
fi

AUTH_HEADER="Authorization: Bearer $API_KEY"
CONTENT_TYPE="Content-Type: application/json"

cmd="$1"
shift || true

case "$cmd" in
  list)
    curl -s -H "$AUTH_HEADER" "$API_URL/api/teams" | jq .
    ;;
  get)
    team_id="$1"
    if [ -z "$team_id" ]; then
      echo "Usage: $0 get <team_id>"
      exit 1
    fi
    curl -s -H "$AUTH_HEADER" "$API_URL/api/teams/$team_id" | jq .
    ;;
  create)
    name="$1"
    desc="${2:-}"
    if [ -z "$name" ]; then
      echo "Usage: $0 create <name> [description]"
      exit 1
    fi
    curl -s -X POST -H "$AUTH_HEADER" -H "$CONTENT_TYPE" \
      -d "{\"name\":\"$name\",\"description\":\"$desc\"}" \
      "$API_URL/api/teams" | jq .
    ;;
  members)
    team_id="$1"
    if [ -z "$team_id" ]; then
      echo "Usage: $0 members <team_id>"
      exit 1
    fi
    curl -s -H "$AUTH_HEADER" "$API_URL/api/teams/$team_id/members" | jq .
    ;;
  memories)
    team_id="$1"
    if [ -z "$team_id" ]; then
      echo "Usage: $0 memories <team_id>"
      exit 1
    fi
    curl -s -H "$AUTH_HEADER" "$API_URL/api/teams/$team_id/memories" | jq .
    ;;
  *)
    echo "AI Teammate Teams CLI"
    echo ""
    echo "Usage: $0 <command> [args]"
    echo ""
    echo "Commands:"
    echo "  list              List all teams"
    echo "  get <id>          Get team details"
    echo "  create <name>     Create a team"
    echo "  members <id>      List team members"
    echo "  memories <id>     List team memories"
    ;;
esac

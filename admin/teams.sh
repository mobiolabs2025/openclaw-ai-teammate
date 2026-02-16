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
  delete)
    team_id="$1"
    if [ -z "$team_id" ]; then
      echo "Usage: $0 delete <team_id>"
      exit 1
    fi
    curl -s -X DELETE -H "$AUTH_HEADER" "$API_URL/api/teams/$team_id" | jq .
    ;;
  members)
    team_id="$1"
    if [ -z "$team_id" ]; then
      echo "Usage: $0 members <team_id>"
      exit 1
    fi
    curl -s -H "$AUTH_HEADER" "$API_URL/api/teams/$team_id/members" | jq .
    ;;
  invite)
    team_id="$1"
    email="$2"
    role="${3:-member}"
    if [ -z "$team_id" ] || [ -z "$email" ]; then
      echo "Usage: $0 invite <team_id> <email> [role]"
      exit 1
    fi
    curl -s -X POST -H "$AUTH_HEADER" -H "$CONTENT_TYPE" \
      -d "{\"email\":\"$email\",\"role\":\"$role\"}" \
      "$API_URL/api/teams/$team_id/members" | jq .
    ;;
  agents)
    team_id="$1"
    if [ -z "$team_id" ]; then
      echo "Usage: $0 agents <team_id>"
      exit 1
    fi
    curl -s -H "$AUTH_HEADER" "$API_URL/api/teams/$team_id/agents" | jq .
    ;;
  add-agent)
    team_id="$1"
    agent_id="$2"
    if [ -z "$team_id" ] || [ -z "$agent_id" ]; then
      echo "Usage: $0 add-agent <team_id> <agent_id>"
      exit 1
    fi
    curl -s -X POST -H "$AUTH_HEADER" "$API_URL/api/teams/$team_id/agents/$agent_id" | jq .
    ;;
  remove-agent)
    team_id="$1"
    agent_id="$2"
    if [ -z "$team_id" ] || [ -z "$agent_id" ]; then
      echo "Usage: $0 remove-agent <team_id> <agent_id>"
      exit 1
    fi
    curl -s -X DELETE -H "$AUTH_HEADER" "$API_URL/api/teams/$team_id/agents/$agent_id" | jq .
    ;;
  memories)
    team_id="$1"
    if [ -z "$team_id" ]; then
      echo "Usage: $0 memories <team_id>"
      exit 1
    fi
    curl -s -H "$AUTH_HEADER" "$API_URL/api/teams/$team_id/memories" | jq .
    ;;
  add-memory)
    team_id="$1"
    content="$2"
    category="${3:-fact}"
    if [ -z "$team_id" ] || [ -z "$content" ]; then
      echo "Usage: $0 add-memory <team_id> <content> [category]"
      exit 1
    fi
    curl -s -X POST -H "$AUTH_HEADER" -H "$CONTENT_TYPE" \
      -d "{\"content\":\"$content\",\"category\":\"$category\"}" \
      "$API_URL/api/teams/$team_id/memories" | jq .
    ;;
  delete-memory)
    team_id="$1"
    memory_id="$2"
    if [ -z "$team_id" ] || [ -z "$memory_id" ]; then
      echo "Usage: $0 delete-memory <team_id> <memory_id>"
      exit 1
    fi
    curl -s -X DELETE -H "$AUTH_HEADER" "$API_URL/api/teams/$team_id/memories/$memory_id" | jq .
    ;;
  integrations)
    team_id="$1"
    if [ -z "$team_id" ]; then
      echo "Usage: $0 integrations <team_id>"
      exit 1
    fi
    curl -s -H "$AUTH_HEADER" "$API_URL/api/teams/$team_id/integrations" | jq .
    ;;
  set-default-agent)
    team_id="$1"
    agent_id="$2"
    if [ -z "$team_id" ] || [ -z "$agent_id" ]; then
      echo "Usage: $0 set-default-agent <team_id> <agent_id>"
      exit 1
    fi
    curl -s -X PUT -H "$AUTH_HEADER" -H "$CONTENT_TYPE" \
      -d "{\"agent_id\":\"$agent_id\"}" \
      "$API_URL/api/teams/$team_id/default-agent" | jq .
    ;;
  api-keys)
    team_id="$1"
    if [ -z "$team_id" ]; then
      echo "Usage: $0 api-keys <team_id>"
      exit 1
    fi
    curl -s -H "$AUTH_HEADER" "$API_URL/api/teams/$team_id/api-keys" | jq .
    ;;
  create-api-key)
    team_id="$1"
    name="${2:-Team API Key}"
    if [ -z "$team_id" ]; then
      echo "Usage: $0 create-api-key <team_id> [name]"
      exit 1
    fi
    curl -s -X POST -H "$AUTH_HEADER" -H "$CONTENT_TYPE" \
      -d "{\"name\":\"$name\"}" \
      "$API_URL/api/teams/$team_id/api-keys" | jq .
    ;;
  chat)
    team_id="$1"
    message="$2"
    mode="${3:-round-robin}"
    agent_id="${4:-}"
    if [ -z "$team_id" ] || [ -z "$message" ]; then
      echo "Usage: $0 chat <team_id> <message> [mode] [agent_id]"
      echo ""
      echo "Modes:"
      echo "  round-robin  - Sequential responses (default)"
      echo "  parallel     - Independent responses"
      echo "  debate       - Pro/Con debate"
      echo "  brainstorm   - Ideas + voting"
      echo "  expert       - Auto-select expert"
      exit 1
    fi
    if [ -n "$agent_id" ]; then
      curl -s -X POST -H "$AUTH_HEADER" -H "$CONTENT_TYPE" \
        -d "{\"message\":\"$message\",\"mode\":\"$mode\",\"target_agent_id\":\"$agent_id\"}" \
        "$API_URL/api/teams/$team_id/chat" | jq .
    else
      curl -s -X POST -H "$AUTH_HEADER" -H "$CONTENT_TYPE" \
        -d "{\"message\":\"$message\",\"mode\":\"$mode\"}" \
        "$API_URL/api/teams/$team_id/chat" | jq .
    fi
    ;;
  *)
    echo "AI Teammate Teams CLI"
    echo ""
    echo "Usage: $0 <command> [args]"
    echo ""
    echo "Team Management:"
    echo "  list                          List all teams"
    echo "  get <id>                      Get team details"
    echo "  create <name> [desc]          Create a team"
    echo "  delete <id>                   Delete a team"
    echo ""
    echo "Members:"
    echo "  members <id>                  List team members"
    echo "  invite <id> <email> [role]    Invite member (email)"
    echo ""
    echo "Agents:"
    echo "  agents <id>                   List team agents"
    echo "  add-agent <id> <agent_id>     Add agent to team"
    echo "  remove-agent <id> <agent_id>  Remove agent from team"
    echo "  set-default-agent <id> <aid>  Set default agent"
    echo ""
    echo "Memories:"
    echo "  memories <id>                 List team memories"
    echo "  add-memory <id> <content>     Add memory"
    echo "  delete-memory <id> <mem_id>   Delete memory"
    echo ""
    echo "Integrations:"
    echo "  integrations <id>             Get integrations info"
    echo "  api-keys <id>                 List API keys"
    echo "  create-api-key <id> [name]    Create API key"
    echo ""
    echo "Chat:"
    echo "  chat <id> <msg> [mode] [aid]  Team discussion"
    echo "    Modes: round-robin, parallel, debate, brainstorm, expert"
    ;;
esac

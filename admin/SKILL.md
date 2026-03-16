# AI Teammate Admin Skill

Full management access to AI Teammate platform.

## Setup

Set your API key:
```bash
export AI_TEAMMATE_API_KEY="at_your_key_here"
```

Get your key at: https://ai-teammate.net/settings

## Commands

### Agents
```bash
./agents.sh list                    # List all agents
./agents.sh get <id>               # Get agent details
./agents.sh create <name> [desc]   # Create agent
./agents.sh delete <id>            # Delete agent
```

### Teams
```bash
./teams.sh list                     # List teams
./teams.sh get <id>                # Get team details
./teams.sh create <name> [desc]    # Create team
./teams.sh delete <id>             # Delete team
./teams.sh invite <id> <email>     # Invite member
./teams.sh agents <id>             # List team agents
./teams.sh add-agent <team> <agent> # Add agent to team
./teams.sh memories <id>           # List team memories
./teams.sh integrations <id>       # Get integrations
./teams.sh api-keys <id>           # List API keys
```

### Chat
```bash
./chat.sh <agent_id> "message"     # Chat with agent
```

### Admin
```bash
./admin.sh stats                   # Platform statistics
./admin.sh users                   # List users
```

### OpenClaw Integration
```bash
./tools.sh                         # Get tool definitions for OpenClaw
```

## API Endpoints

- **Tools**: `https://ai-teammate.net/api/openclaw/tools`
- **Info**: `https://ai-teammate.net/api/openclaw/info`
- **Skill Download**: `https://ai-teammate.net/api/openclaw/skill.zip`

## Permissions

This skill requires **admin API key** with full access.

⚠️ For agents/bots, use the `agent/` skill instead (chat only).

## Version

- v1.1.0 (2026-03-17) - Added OpenClaw API endpoints

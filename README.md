<p align="center">
  <img src="https://agent.mobiolabs.net/logo.svg" width="80" height="80" alt="AI Teammate Logo">
</p>

<h1 align="center">AI Teammate OpenClaw Skills</h1>

<p align="center">
  Control <a href="https://agent.mobiolabs.net">AI Teammate</a> platform from your OpenClaw instance.
</p>

<p align="center">
  <a href="https://agent.mobiolabs.net"><img src="https://img.shields.io/badge/AI%20Teammate-Live-3b82f6?style=flat-square" alt="AI Teammate"></a>
  <a href="https://openclaw.ai"><img src="https://img.shields.io/badge/OpenClaw-Skill-10b981?style=flat-square" alt="OpenClaw"></a>
  <a href="https://github.com/mobiolabs2025/openclaw-ai-teammate/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-MIT-green?style=flat-square" alt="License"></a>
</p>

---

Manage AI agents, teams, and memories — all from your terminal.

## Available Skills

| Skill | Description | Use Case |
|-------|-------------|----------|
| **[admin/](./admin/)** | Full management access | Platform owners, developers |
| **[agent/](./agent/)** | Chat only (limited) | AI agents, bots, safe API access |

## Installation

1. Copy `.env.example` to `.env` (in the skill folder you want to use)
2. Set your API key:
```bash
MOBIO_AGENT_URL=https://agent.mobiolabs.net
MOBIO_AGENT_API_KEY=at_your_api_key_here
```

> Get your API key from AI Teammate website: Settings > API Keys

---

## Admin Skill (`admin/`)

Full access to agents, teams, members, and memories.

### Agent Management

```bash
cd admin/

# List agents
./agents.sh list

# Get agent details
./agents.sh get <agent_id>

# Create agent
./agents.sh create "My Agent" "Description here"

# Delete agent
./agents.sh delete <agent_id>
```

### Chat with Agents

```bash
./chat.sh <agent_id> "Hello, how are you?"
```

### Team Management

```bash
# List teams
./teams.sh list

# Get team details
./teams.sh get <team_id>

# Create team
./teams.sh create "Dev Team" "Knowledge sharing for developers"

# Delete team
./teams.sh delete <team_id>
```

### Member Management

```bash
# List members
./teams.sh members <team_id>

# Invite by email (existing user → instant add, new user → sends invite email)
./teams.sh invite <team_id> <email> [role]
# role: member (default), admin
```

### Team Agent Management

```bash
# List team agents
./teams.sh agents <team_id>

# Add agent to team
./teams.sh add-agent <team_id> <agent_id>

# Remove agent from team
./teams.sh remove-agent <team_id> <agent_id>
```

### Team Memory

```bash
# List team memories
./teams.sh memories <team_id>

# Add memory
./teams.sh add-memory <team_id> "Content to remember"
```

### Team Integrations

```bash
# Get integrations (Telegram, Discord, API keys)
./teams.sh integrations <team_id>

# Get API keys
./teams.sh api-keys <team_id>
```

### Admin Operations

```bash
# Platform stats (admin only)
./admin.sh stats

# List users (admin only)
./admin.sh users
```

---

## Agent Skill (`agent/`)

**Limited access** — chat only, safe for AI-to-AI communication.

```bash
cd agent/

# Chat with an agent
./chat.sh <agent_id> "What's on my schedule today?"
```

### Permissions

| Action | Admin | Agent |
|--------|-------|-------|
| Chat with agents | ✅ | ✅ |
| Create/delete agents | ✅ | ❌ |
| Team management | ✅ | ❌ |
| View memories | ✅ | ❌ |
| Admin operations | ✅ | ❌ |

---

## API Reference

Base URL: `https://agent.mobiolabs.net`

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/agents` | GET | List your agents |
| `/api/agents/{id}` | GET | Get agent details |
| `/api/agents/{id}/chat` | POST | Chat with agent |
| `/api/teams` | GET | List your teams |
| `/api/teams/{id}` | GET | Get team details |
| `/api/teams/{id}/memories` | GET | List team memories |

Full documentation: https://agent.mobiolabs.net/docs/api

---

## License

MIT © [MobioLabs](https://mobiolabs.net)

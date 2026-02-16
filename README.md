<p align="center">
  <img src="https://agent.mobiolabs.net/logo.svg" width="80" height="80" alt="AI Teammate Logo">
</p>

<h1 align="center">AI Teammate OpenClaw Skill</h1>

<p align="center">
  Control <a href="https://agent.mobiolabs.net">AI Teammate</a> platform from your OpenClaw instance.
</p>

<p align="center">
  <a href="https://agent.mobiolabs.net"><img src="https://img.shields.io/badge/AI%20Teammate-Live-3b82f6?style=flat-square" alt="AI Teammate"></a>
  <a href="https://github.com/mobiolabs2025/openclaw-ai-teammate/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-MIT-green?style=flat-square" alt="License"></a>
</p>

---

Manage AI agents, teams, and memories — all from your terminal.

## Installation

1. Copy `.env.example` to `.env`
2. Set your API key:
```bash
MOBIO_AGENT_URL=https://agent.mobiolabs.net
MOBIO_AGENT_API_KEY=at_your_api_key_here
```

> Get your API key from AI Teammate website: Settings > API Keys

## Scripts

| File | Description |
|------|-------------|
| `agents.sh` | Agent CRUD operations |
| `chat.sh` | Chat with agents |
| `teams.sh` | Team management (members, agents, memory, integrations) |
| `skills.sh` | List available skills |

---

## Agent Management

```bash
# List agents
./agents.sh list

# Get agent details
./agents.sh get <agent_id>

# Create agent
./agents.sh create "My Agent" "Description here"

# Delete agent
./agents.sh delete <agent_id>
```

## Chat with Agents

```bash
./chat.sh <agent_id> "Hello, how are you?"
```

---

## Team Management

### Basics

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

### Agent Management

```bash
# List team agents
./teams.sh agents <team_id>

# Add agent to team
./teams.sh add-agent <team_id> <agent_id>

# Remove agent from team
./teams.sh remove-agent <team_id> <agent_id>

# Set default agent (responds to social channels)
./teams.sh set-default-agent <team_id> <agent_id>
```

### Team Memory (RAG)

```bash
# List memories
./teams.sh memories <team_id>

# Add memory (auto-embedded)
./teams.sh add-memory <team_id> "Content to save" [category]
# category: fact (default), knowledge, resource, bookmark

# Delete memory
./teams.sh delete-memory <team_id> <memory_id>
```

### Integrations & API

```bash
# View integrations (Telegram, Discord, etc.)
./teams.sh integrations <team_id>

# List API keys
./teams.sh api-keys <team_id>

# Create API key
./teams.sh create-api-key <team_id> "Key Name"
```

---

## Skills

```bash
./skills.sh list
```

---

## API Endpoints

### Agents
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/agents` | List agents |
| GET | `/api/agents/:id` | Get agent |
| POST | `/api/agents` | Create agent |
| PUT | `/api/agents/:id` | Update agent |
| DELETE | `/api/agents/:id` | Delete agent |
| POST | `/api/agents/:id/chat` | Chat with agent |

### Teams
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/teams` | List teams |
| GET | `/api/teams/:id` | Get team |
| POST | `/api/teams` | Create team |
| DELETE | `/api/teams/:id` | Delete team |
| GET | `/api/teams/:id/members` | List members |
| POST | `/api/teams/:id/members` | Invite member |
| GET | `/api/teams/:id/agents` | List team agents |
| POST | `/api/teams/:id/agents/:aid` | Add agent |
| DELETE | `/api/teams/:id/agents/:aid` | Remove agent |
| PUT | `/api/teams/:id/default-agent` | Set default agent |
| GET | `/api/teams/:id/memories` | List memories |
| POST | `/api/teams/:id/memories` | Add memory |
| PUT | `/api/teams/:id/memories/:mid` | Update memory |
| DELETE | `/api/teams/:id/memories/:mid` | Delete memory |
| GET | `/api/teams/:id/integrations` | Get integrations |
| GET | `/api/teams/:id/api-keys` | List API keys |
| POST | `/api/teams/:id/api-keys` | Create API key |

### Skills
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/skills` | List skills |

---

## Permissions

API keys are tied to **your user account**:
- You can only control your own agents
- You can only access teams you're a member of
- Team roles determine access:
  - **owner**: Delete team, full management
  - **admin**: Invite members, manage agents
  - **member**: View, add memories

---

## Links

- **AI Teammate**: https://agent.mobiolabs.net
- **API Docs**: https://agent.mobiolabs.net/docs

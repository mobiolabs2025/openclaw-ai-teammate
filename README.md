<p align="center">
  <img src="https://agent.mobiolabs.net/logo.svg" width="80" alt="AI Teammate Logo">
</p>

<h1 align="center">AI Teammate Skills for OpenClaw</h1>

<p align="center">
  <a href="https://agent.mobiolabs.net">AI Teammate</a> •
  <a href="https://openclaw.ai">OpenClaw</a> •
  <a href="https://clawhub.com">ClawHub</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/platform-AI%20Teammate-blue" alt="Platform">
  <img src="https://img.shields.io/badge/openclaw-skill-green" alt="OpenClaw Skill">
  <img src="https://img.shields.io/badge/license-MIT-orange" alt="License">
</p>

---

## Skills

| Skill | Description | Use Case |
|-------|-------------|----------|
| **[admin/](./admin/)** | Full management access | Platform owners, developers |
| **[agent/](./agent/)** | Chat only (limited) | AI agents, bots |

## Quick Start

### 1. Get API Key

1. Go to [AI Teammate](https://agent.mobiolabs.net)
2. Create an account → Settings → API Keys
3. Generate a new key (`at_...`)

### 2. Setup

```bash
export AI_TEAMMATE_API_KEY="at_your_key_here"
```

### 3. Use

**For Admins/Developers:**
```bash
cd admin/
./agents.sh list
./chat.sh <agent_id> "Hello!"
```

**For AI Agents (limited):**
```bash
cd agent/
./chat.sh <agent_id> "Hello!"
```

## Skill Details

### Admin Skill (`admin/`)

Full access to:
- Agent CRUD (create, read, update, delete)
- Team management
- Member invitations
- Memory management
- Platform statistics

### Agent Skill (`agent/`)

Limited to:
- Chat with agents only
- No management operations
- Safe for AI-to-AI communication

## API Reference

Base URL: `https://agent.mobiolabs.net`

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/agents` | GET | List agents |
| `/api/agents/{id}` | GET | Get agent |
| `/api/agents/{id}/chat` | POST | Chat with agent |
| `/api/teams` | GET | List teams |

Full docs: https://agent.mobiolabs.net/docs/api

## License

MIT

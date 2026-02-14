# OpenClaw AI Teammate Skill

Connect [AI Teammate](https://agent.mobiolabs.net) to your OpenClaw instance.

Manage AI agents, chat with them, and view statistics - all from your terminal.

## Features

- 🤖 **Agent Management** - Create, list, update, delete agents
- 💬 **Direct Chat** - Talk to agents via CLI
- 🧩 **Skills** - View available agent skills
- 📊 **Analytics** - Monitor usage and performance

## Quick Start

### 1. Clone to your OpenClaw skills directory

```bash
cd ~/openclaw/skills
git clone https://github.com/mobiolabs/openclaw-ai-teammate.git ai-teammate
```

### 2. Configure environment

```bash
cd ai-teammate
cp .env.example .env
```

Edit `.env` and add your API key:

```bash
AI_TEAMMATE_URL=https://agent.mobiolabs.net
AI_TEAMMATE_API_KEY=your_api_key_here
```

> Get your API key from [AI Teammate Settings](https://agent.mobiolabs.net/settings/api)

### 3. Test the connection

```bash
./agents.sh list
```

## Commands

### Agent Management

```bash
# List all agents
./agents.sh list

# Get agent details
./agents.sh get <agent_id>

# Create new agent
./agents.sh create --name "My Agent" --personality friendly --skills core,search

# Delete agent
./agents.sh delete <agent_id>
```

### Chat

```bash
# Send message to agent
./chat.sh <agent_id> "Hello, how are you?"

# Example
./chat.sh agent_1 "Analyze Samsung Electronics stock"
```

### Skills

```bash
# List available skills
./skills.sh list
```

### Admin

```bash
# View statistics
./admin.sh stats

# View recent logs
./admin.sh logs

# Health check
./admin.sh health
```

## Example Usage with OpenClaw

Once installed, you can ask your OpenClaw agent:

```
"Show my AI Teammate agents"
→ Runs: ./agents.sh list

"Create a new agent called Finance Helper"
→ Runs: ./agents.sh create --name "Finance Helper"

"Ask my Code Helper agent to review this function"
→ Runs: ./chat.sh agent_2 "Please review this function..."
```

## API Reference

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/agents` | GET | List all agents |
| `/api/agents/:id` | GET | Get agent details |
| `/api/agents` | POST | Create agent |
| `/api/agents/:id` | PUT | Update agent |
| `/api/agents/:id` | DELETE | Delete agent |
| `/api/chat` | POST | Send message |
| `/api/skills` | GET | List skills |
| `/api/admin/stats` | GET | Get statistics |

## Environment Variables

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `AI_TEAMMATE_URL` | No | `https://agent.mobiolabs.net` | API base URL |
| `AI_TEAMMATE_API_KEY` | Yes | - | Your API key |

## Requirements

- Bash 4.0+
- curl
- jq (optional, for pretty output)

## License

MIT License - see [LICENSE](LICENSE)

## Links

- [AI Teammate](https://agent.mobiolabs.net) - Build AI agents
- [OpenClaw](https://openclaw.ai) - AI assistant framework
- [Documentation](https://agent.mobiolabs.net/integrations/openclaw) - Integration guide

---

Made with ❤️ by [Mobio Labs](https://mobiolabs.net)

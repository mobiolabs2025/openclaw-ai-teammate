# AI Teammate Chat Skill

**Limited access** for AI agents - chat only, no management.

## Setup

Set your API key:
```bash
export AI_TEAMMATE_API_KEY="at_your_key_here"
```

## Commands

### Chat with Agent
```bash
./chat.sh <agent_id> "your message"
```

Example:
```bash
./chat.sh abc-123 "What's the weather today?"
```

## What You Can Do

✅ Send messages to agents
✅ Get responses

## What You Cannot Do

❌ Create/delete agents
❌ Modify agent settings
❌ Access team management
❌ View other users' data
❌ Admin operations

## For Full Access

If you need management capabilities, use the `admin/` skill instead.
This requires an admin API key.

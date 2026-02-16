# AI Teammate Skill

OpenClaw에서 AI Teammate 플랫폼을 제어하는 스킬입니다.

## 설정

`.env` 파일에 API 키 설정:
```bash
MOBIO_AGENT_URL=https://agent.mobiolabs.net
MOBIO_AGENT_API_KEY=at_your_api_key_here
```

## 사용법

### 에이전트 관리
```bash
./agents.sh list              # 에이전트 목록
./agents.sh get <agent_id>    # 에이전트 상세
./agents.sh create "name"     # 에이전트 생성
./agents.sh delete <agent_id> # 에이전트 삭제
```

### 에이전트와 대화
```bash
./chat.sh <agent_id> "메시지"
```

### 팀 관리
```bash
./teams.sh list               # 팀 목록
./teams.sh get <team_id>      # 팀 상세
./teams.sh create "name"      # 팀 생성
./teams.sh members <team_id>  # 팀 멤버 목록
```

### 스킬 목록
```bash
./skills.sh list
```

## 스크립트

| 스크립트 | 설명 |
|----------|------|
| `agents.sh` | 에이전트 CRUD |
| `chat.sh` | 에이전트와 대화 |
| `teams.sh` | 팀 관리 |
| `skills.sh` | 스킬 목록 |

## API 엔드포인트

### Agents
- `GET /api/agents` - 에이전트 목록
- `GET /api/agents/:id` - 에이전트 상세
- `POST /api/agents` - 에이전트 생성
- `DELETE /api/agents/:id` - 에이전트 삭제
- `POST /api/agents/:id/chat` - 대화

### Teams
- `GET /api/teams` - 팀 목록
- `GET /api/teams/:id` - 팀 상세
- `POST /api/teams` - 팀 생성
- `GET /api/teams/:id/members` - 팀 멤버
- `POST /api/teams/:id/agents` - 에이전트 추가
- `GET /api/teams/:id/memories` - 팀 메모리

### Skills
- `GET /api/skills` - 스킬 목록

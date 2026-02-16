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
# 기본
./teams.sh list                          # 팀 목록
./teams.sh get <team_id>                 # 팀 상세
./teams.sh create "name" "description"   # 팀 생성
./teams.sh delete <team_id>              # 팀 삭제

# 멤버
./teams.sh members <team_id>             # 멤버 목록
./teams.sh invite <team_id> <email>      # 이메일 초대

# 에이전트
./teams.sh agents <team_id>              # 팀 에이전트 목록
./teams.sh add-agent <team_id> <aid>     # 에이전트 추가
./teams.sh remove-agent <team_id> <aid>  # 에이전트 제거
./teams.sh set-default-agent <tid> <aid> # 대표 에이전트 설정

# 메모리
./teams.sh memories <team_id>            # 팀 메모리 목록
./teams.sh add-memory <tid> "content"    # 메모리 추가
./teams.sh delete-memory <tid> <mid>     # 메모리 삭제

# 연동
./teams.sh integrations <team_id>        # 연동 정보
./teams.sh api-keys <team_id>            # API 키 목록
./teams.sh create-api-key <tid> "name"   # API 키 생성
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
| `teams.sh` | 팀 관리 (멤버, 에이전트, 메모리, 연동) |
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
- `DELETE /api/teams/:id` - 팀 삭제
- `GET /api/teams/:id/members` - 멤버 목록
- `POST /api/teams/:id/members` - 멤버 초대
- `GET /api/teams/:id/agents` - 팀 에이전트
- `POST /api/teams/:id/agents/:aid` - 에이전트 추가
- `DELETE /api/teams/:id/agents/:aid` - 에이전트 제거
- `PUT /api/teams/:id/default-agent` - 대표 에이전트 설정
- `GET /api/teams/:id/memories` - 메모리 목록
- `POST /api/teams/:id/memories` - 메모리 추가
- `PUT /api/teams/:id/memories/:mid` - 메모리 수정
- `DELETE /api/teams/:id/memories/:mid` - 메모리 삭제
- `GET /api/teams/:id/integrations` - 연동 정보
- `GET /api/teams/:id/api-keys` - API 키 목록
- `POST /api/teams/:id/api-keys` - API 키 생성

### Skills
- `GET /api/skills` - 스킬 목록

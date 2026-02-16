# AI Teammate OpenClaw Skill

OpenClaw에서 [AI Teammate](https://agent.mobiolabs.net) 플랫폼을 제어하는 스킬입니다.

## 설치

1. `.env.example`을 `.env`로 복사
2. API 키 설정:
```bash
MOBIO_AGENT_URL=https://agent.mobiolabs.net
MOBIO_AGENT_API_KEY=at_your_api_key_here
```

> API 키는 AI Teammate 웹사이트 Settings > API Keys에서 생성할 수 있습니다.

## 스크립트

| 파일 | 설명 |
|------|------|
| `agents.sh` | 에이전트 CRUD |
| `chat.sh` | 에이전트 채팅 |
| `teams.sh` | 팀 관리 (멤버, 에이전트, 메모리, 연동) |
| `skills.sh` | 스킬 목록 |

---

## 에이전트 관리

```bash
# 에이전트 목록
./agents.sh list

# 에이전트 상세
./agents.sh get <agent_id>

# 에이전트 생성
./agents.sh create "My Agent" "Description here"

# 에이전트 삭제
./agents.sh delete <agent_id>
```

## 에이전트와 대화

```bash
./chat.sh <agent_id> "안녕하세요"
```

---

## 팀 관리

### 기본

```bash
# 팀 목록
./teams.sh list

# 팀 상세
./teams.sh get <team_id>

# 팀 생성
./teams.sh create "개발팀" "개발 관련 지식 공유"

# 팀 삭제
./teams.sh delete <team_id>
```

### 멤버 관리

```bash
# 멤버 목록
./teams.sh members <team_id>

# 이메일로 초대 (가입 유저 → 바로 추가, 미가입 → 초대 이메일 발송)
./teams.sh invite <team_id> <email> [role]
# role: member (기본), admin
```

### 에이전트 관리

```bash
# 팀에 속한 에이전트 목록
./teams.sh agents <team_id>

# 에이전트를 팀에 추가
./teams.sh add-agent <team_id> <agent_id>

# 에이전트를 팀에서 제거
./teams.sh remove-agent <team_id> <agent_id>

# 대표 에이전트 설정 (소셜 채널 기본 응답자)
./teams.sh set-default-agent <team_id> <agent_id>
```

### 팀 메모리 (RAG)

```bash
# 메모리 목록
./teams.sh memories <team_id>

# 메모리 추가 (자동 임베딩)
./teams.sh add-memory <team_id> "저장할 내용" [category]
# category: fact (기본), knowledge, resource, bookmark

# 메모리 삭제
./teams.sh delete-memory <team_id> <memory_id>
```

### 연동 & API

```bash
# 연동 정보 (Telegram, Discord 등)
./teams.sh integrations <team_id>

# API 키 목록
./teams.sh api-keys <team_id>

# API 키 생성
./teams.sh create-api-key <team_id> "Key Name"
```

---

## 스킬 목록

```bash
./skills.sh list
```

---

## API 엔드포인트

### Agents
| Method | Endpoint | 설명 |
|--------|----------|------|
| GET | `/api/agents` | 에이전트 목록 |
| GET | `/api/agents/:id` | 에이전트 상세 |
| POST | `/api/agents` | 에이전트 생성 |
| PUT | `/api/agents/:id` | 에이전트 수정 |
| DELETE | `/api/agents/:id` | 에이전트 삭제 |
| POST | `/api/agents/:id/chat` | 에이전트와 대화 |

### Teams
| Method | Endpoint | 설명 |
|--------|----------|------|
| GET | `/api/teams` | 팀 목록 |
| GET | `/api/teams/:id` | 팀 상세 |
| POST | `/api/teams` | 팀 생성 |
| DELETE | `/api/teams/:id` | 팀 삭제 |
| GET | `/api/teams/:id/members` | 멤버 목록 |
| POST | `/api/teams/:id/members` | 멤버 초대 |
| GET | `/api/teams/:id/agents` | 팀 에이전트 목록 |
| POST | `/api/teams/:id/agents/:aid` | 에이전트 추가 |
| DELETE | `/api/teams/:id/agents/:aid` | 에이전트 제거 |
| PUT | `/api/teams/:id/default-agent` | 대표 에이전트 설정 |
| GET | `/api/teams/:id/memories` | 메모리 목록 |
| POST | `/api/teams/:id/memories` | 메모리 추가 |
| PUT | `/api/teams/:id/memories/:mid` | 메모리 수정 |
| DELETE | `/api/teams/:id/memories/:mid` | 메모리 삭제 |
| GET | `/api/teams/:id/integrations` | 연동 정보 |
| GET | `/api/teams/:id/api-keys` | API 키 목록 |
| POST | `/api/teams/:id/api-keys` | API 키 생성 |

### Skills
| Method | Endpoint | 설명 |
|--------|----------|------|
| GET | `/api/skills` | 스킬 목록 |

---

## 권한

API 키는 **해당 사용자 계정**에 연결됩니다:
- 자신의 에이전트만 제어 가능
- 자신이 멤버인 팀만 접근 가능
- 팀 내 역할에 따른 권한:
  - **owner**: 팀 삭제, 모든 관리
  - **admin**: 멤버 초대, 에이전트 관리
  - **member**: 조회, 메모리 추가

---

## 링크

- **AI Teammate**: https://agent.mobiolabs.net
- **API 문서**: https://agent.mobiolabs.net/docs

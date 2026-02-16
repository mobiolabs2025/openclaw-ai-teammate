# AI Teammate OpenClaw Skill

OpenClaw에서 AI Teammate 플랫폼을 제어하는 스킬입니다.

## 설치

1. `.env.example`을 `.env`로 복사
2. API 키 설정:
```bash
MOBIO_AGENT_URL=https://agent.mobiolabs.net
MOBIO_AGENT_API_KEY=at_your_api_key_here
```

## 기능

### 에이전트 관리
- 에이전트 목록 조회
- 에이전트 생성/삭제
- 에이전트와 대화

### 팀 관리
- 팀 목록 조회
- 팀 생성
- 팀 멤버 관리
- 팀 메모리 (RAG)

### 스킬 관리
- 플랫폼 스킬 목록 조회

## 스크립트

| 파일 | 설명 |
|------|------|
| `agents.sh` | 에이전트 CRUD |
| `chat.sh` | 에이전트 채팅 |
| `teams.sh` | 팀 관리 |
| `skills.sh` | 스킬 목록 |

## 사용 예시

```bash
# 에이전트 목록
./agents.sh list

# 에이전트와 대화
./chat.sh agent_123 "안녕하세요"

# 팀 생성
./teams.sh create "개발팀" "개발 관련 지식 공유"

# 팀 메모리 조회
./teams.sh memories team_456
```

## API 문서

https://agent.mobiolabs.net/docs

# Agent Platform Skill

Agent Platform (agent.mobiolabs.net) 연동 스킬

## 설정

환경변수 또는 `.env` 파일:
```bash
AGENT_PLATFORM_URL=https://agent.mobiolabs.net
AGENT_PLATFORM_API_KEY=your_api_key  # 선택사항 (인증 필요시)
```

## 사용법

### 에이전트 목록 조회
```bash
./agents.sh list
```

### 에이전트 상세 조회
```bash
./agents.sh get <agent_id>
```

### 에이전트 생성
```bash
./agents.sh create --name "My Agent" --personality friendly --skills core,search
```

### 에이전트와 채팅
```bash
./chat.sh <agent_id> "안녕하세요"
```

### 스킬 목록 조회
```bash
./skills.sh list
```

### 통계 조회 (관리자)
```bash
./admin.sh stats
```

## API 엔드포인트

| 메서드 | 경로 | 설명 |
|--------|------|------|
| GET | /api/agents | 에이전트 목록 |
| GET | /api/agents/:id | 에이전트 상세 |
| POST | /api/agents | 에이전트 생성 |
| PUT | /api/agents/:id | 에이전트 수정 |
| DELETE | /api/agents/:id | 에이전트 삭제 |
| POST | /api/chat | 채팅 |
| GET | /api/skills | 스킬 목록 |
| GET | /api/admin/stats | 통계 |

## 예시

```
사용자: 내 에이전트 목록 보여줘
→ ./agents.sh list 실행

사용자: Finance Assistant한테 "삼성전자 분석해줘" 물어봐
→ ./chat.sh agent_1 "삼성전자 분석해줘" 실행

사용자: 새 에이전트 만들어줘, 이름은 Code Helper
→ ./agents.sh create --name "Code Helper" 실행
```

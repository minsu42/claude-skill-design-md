# design-md — Claude Code Skill

스크린샷을 분석해 [google-labs-code/design.md](https://github.com/google-labs-code/design.md) 형식의 `DESIGN.md`를 자동 생성하는 Claude Code 스킬.

## 기능

- 페이지 스크린샷 1장 이상을 입력으로 받아 UI 구조·색상·타이포그래피·컴포넌트를 분석
- google-labs-code/design.md 스펙을 엄격하게 따르는 DESIGN.md 생성
  - YAML 프론트매터: 색상·타이포그래피·간격·radius·컴포넌트 토큰
  - Markdown 본문: Overview, Colors, Typography, Layout, Elevation & Depth, Shapes, Components, Do's and Don'ts 등

## 설치

### `.skill` 파일로 설치 (권장)

1. 이 레포에서 `design-md.skill` 파일을 다운로드
2. Claude Code에서 아래 명령어 실행:
   ```
   /plugin install <다운로드 경로>/design-md.skill
   ```
3. `/reload-plugins` 실행

### 직접 설치

```
~/.claude/skills/design-md/
├── SKILL.md
└── references/
    └── format-spec.md
```

위 구조로 파일을 배치한 뒤 Claude Code에서 `/design-md` 로 로드.

## 사용법

스크린샷을 첨부하고 아래처럼 요청:

```
이 스크린샷들로 DESIGN.md 만들어줘
```

```
docs/design/edu_screenshot/ 폴더의 스크린샷을 분석해서
docs/design/DESIGN.md 경로에 생성해줘
```

출력 경로를 지정하지 않으면 프로젝트 루트에 `DESIGN.md`로 저장됩니다.

## 출력 형식

```yaml
---
version: alpha
name: product-name
description: "브랜드 설명"
colors:
  primary: "#hex"
  ...
typography:
  body-md:
    fontFamily: "..."
    fontSize: 14px
    ...
components:
  button-primary:
    backgroundColor: "{colors.primary}"
    ...
---

## Overview
## Colors
## Typography
...
```

## 파일 구조

```
claude-skill-design-md/
├── SKILL.md              # 스킬 본체
├── references/
│   └── format-spec.md    # design.md 형식 레퍼런스
└── design-md.skill       # 배포용 패키지
```

## 참고

- [google-labs-code/design.md](https://github.com/google-labs-code/design.md) — 형식 원본 스펙
- [Claude Code Skills 문서](https://docs.anthropic.com/claude-code) — 스킬 시스템 안내

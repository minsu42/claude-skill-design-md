# design-md — Claude Code Skill

A Claude Code skill that analyzes screenshots and auto-generates a `DESIGN.md` following the [google-labs-code/design.md](https://github.com/google-labs-code/design.md) spec.

## Install

**One-liner (Mac/Linux):**

```bash
curl -fsSL https://raw.githubusercontent.com/minsu42/claude-skill-design-md/master/install.sh | bash
```

**Manual:**

```bash
mkdir -p ~/.claude/skills/design-md/references
curl -fsSL https://raw.githubusercontent.com/minsu42/claude-skill-design-md/master/SKILL.md \
  -o ~/.claude/skills/design-md/SKILL.md
curl -fsSL https://raw.githubusercontent.com/minsu42/claude-skill-design-md/master/references/format-spec.md \
  -o ~/.claude/skills/design-md/references/format-spec.md
```

Then restart Claude Code or run `/reload-plugins`.

## Usage

Attach one or more screenshots and ask:

```
Make a DESIGN.md from these screenshots
```

```
Analyze screenshots in docs/design/screens/ and write DESIGN.md to docs/design/DESIGN.md
```

If no output path is given, `DESIGN.md` is written to the project root.

## Output format

```yaml
---
version: alpha
name: product-name
description: "Brand description"
colors:
  primary: "#hex"
typography:
  body-md:
    fontFamily: "..."
    fontSize: 14px
components:
  button-primary:
    backgroundColor: "{colors.primary}"
---

## Overview
## Colors
## Typography
## Layout
## Elevation & Depth
## Shapes
## Components
## Do's and Don'ts
```

## What it does

- Accepts one or more page screenshots
- Extracts UI structure, color palette, typography, spacing, and components
- Outputs a `DESIGN.md` that strictly follows the google-labs-code/design.md spec
  - YAML front-matter: color, typography, spacing, radius, and component tokens
  - Markdown body: Overview, Colors, Typography, Layout, Elevation & Depth, Shapes, Components, Do's and Don'ts

## Repository structure

```
claude-skill-design-md/
├── SKILL.md              # skill definition
├── references/
│   └── format-spec.md    # design.md format reference
├── design-md.skill       # distributable package
└── install.sh            # one-liner installer
```

## References

- [google-labs-code/design.md](https://github.com/google-labs-code/design.md) — original format spec
- [Claude Code Skills docs](https://docs.anthropic.com/claude-code) — skill system guide

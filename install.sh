#!/usr/bin/env bash
set -e

DEST="$HOME/.claude/skills/design-md"
BASE="https://raw.githubusercontent.com/minsu42/claude-skill-design-md/master"

mkdir -p "$DEST/references"
curl -fsSL "$BASE/SKILL.md" -o "$DEST/SKILL.md"
curl -fsSL "$BASE/references/format-spec.md" -o "$DEST/references/format-spec.md"

echo "Installed design-md skill to $DEST"
echo "Restart Claude Code or run /reload-plugins to activate."

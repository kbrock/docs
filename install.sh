#!/bin/bash
cp .claude/commands/*.md ~/.claude/commands/
echo "installed $(ls .claude/commands/*.md | wc -l | tr -d ' ') commands to ~/.claude/commands/"

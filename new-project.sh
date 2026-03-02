#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Usage: new-project.sh <project-name>"
  exit 1
fi

PROJECT=$1
DOCS_REPO="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$PROJECT/docs"
cd "$PROJECT"

# CLAUDE.md
cat > CLAUDE.md << 'EOF'
Read docs/PROCESS.md at the start of each session to understand the spec-writing stages.
EOF

# Copy process reference
cp "$DOCS_REPO/README.md" docs/PROCESS.md

# Copy template
cp "$DOCS_REPO/TEMPLATE.md" docs/TEMPLATE.md

# Empty brainstorm files
touch docs/brainstorm-raw.md
touch docs/brainstorm.md

git init
git add .
git commit -m "init: project scaffold"

echo "Created $PROJECT/"
echo "Next: open Claude, start Stage 0 or Stage 1"

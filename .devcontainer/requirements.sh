#!/usr/bin/env bash

pip install mkdocs-material \
	mkdocs-minify-plugin mkdocs-redirects mkdocs-git-revision-date-localized-plugin mkdocs-git-committers-plugin-2 mkdocs-video

set -e

# Install Claude CLI globally
npm install -g @anthropic-ai/claude-code

echo "Start project with: `python3 -m mkdocs serve`"
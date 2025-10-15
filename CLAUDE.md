# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Security Guidelines

**IMPORTANT**: This is a public repository.
- Keep all sensitive settings (API keys, personal preferences, auth tokens) in `.claude/settings.local.json`
- The `.claude/settings.json` file is committed to the repository and should only contain non-sensitive project configuration
- Always review changes to `.claude/settings.json` before committing to ensure no sensitive data is exposed
- **Content Guidelines**: Only include player-facing, public game information in documentation. Never expose internal game mechanics, private systems, or confidential information

## Project Overview

This is a MkDocs documentation site for World War Online game guides, deployed via GitHub Pages. The site uses the Material theme and includes embedded YouTube videos for game unit demonstrations.

## Claude Code Slash Commands

### `/push` - Create Pull Request
Pushes your changes and creates a pull request with proper formatting:
- Reviews all changes since branch diverged from main
- Generates comprehensive PR description using the repository's template
- Includes security reminders about public repository guidelines
- Automatically fills in changelog with AI-generated summary

Usage: Simply type `/push` when you're ready to create a PR

## Build and Development Commands

```bash
# Install dependencies (requires Python 3.x)
pip install mkdocs-material
bash .devcontainer/requirements.sh

# Local development server
python3 -m mkdocs serve

# Build static site
mkdocs build --site-dir _site/

# Deploy to GitHub Pages (automatic via GitHub Actions on push to main)
# Manual deploy: mkdocs gh-deploy
```

## Critical Issues to Check

### Merge Conflicts
Always check for conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`) before committing. These prevent the site from building properly on GitHub Pages.

### YouTube Video Embedding
Videos are embedded using the mkdocs-video plugin with this syntax:
```markdown
![type:video](https://www.youtube.com/embed/VIDEO_ID)
```

If videos aren't appearing on the deployed site, verify:
1. No merge conflicts exist (they prevent GitHub Actions from building)
2. The mkdocs-video plugin is installed
3. The video URL uses the `/embed/` format

## Architecture and Structure

### Content Organization
```
docs/
├── guides/           # Main game guide content
│   ├── units-*.md   # Unit guides with embedded videos
│   ├── bases.md     # Base management guide
│   └── resources.md # Resource management guide
├── legal/           # Legal documents and rules
├── faq/             # FAQ section
└── assets/images/   # Image assets
```

### Key Configuration Files
- `mkdocs.yml` - Site configuration, navigation, plugins
- `.github/workflows/release-main.yml` - GitHub Actions deployment pipeline
- `.devcontainer/requirements.sh` - Python package installation script

### Deployment Pipeline
1. Push to `main` branch triggers GitHub Actions workflow
2. Workflow installs dependencies via `.devcontainer/requirements.sh`
3. Builds site with `mkdocs build --site-dir _site/`
4. Deploys to GitHub Pages at https://guides.worldwaronline.com/

### MkDocs Plugins Used
- `mkdocs-video` - YouTube video embedding
- `mkdocs-minify-plugin` - HTML minification
- `git-revision-date-localized` - Shows last update dates
- `git-committers` - Shows contributors
- `search` - Site search functionality

## Working with Game Guide Content

### Adding New Units
Unit guides follow a consistent pattern with embedded demonstration videos. See `docs/guides/units-normal.md` for examples.

### Resource and Base Documentation
Game mechanics documentation is in `docs/guides/` with interconnected pages for resources, bases, units, and gameplay features.

### Image Assets
Game screenshots and graphics are stored in `docs/assets/images/` using WebP format for optimization.
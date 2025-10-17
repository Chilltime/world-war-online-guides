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
Videos are embedded using standard HTML iframe elements:
```html
<iframe width="560" height="315" src="https://www.youtube.com/embed/VIDEO_ID"
        frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen></iframe>
```

For buttons linking to YouTube playlists, use standard HTML anchor tags with Material theme classes:
```html
<a href="https://www.youtube.com/playlist?list=PLAYLIST_ID" target="_blank" class="md-button md-button--primary">View Full Playlist on YouTube</a>
```

If videos aren't appearing on the deployed site, verify:
1. No merge conflicts exist (they prevent GitHub Actions from building)
2. The video URL uses the `/embed/` format
3. The iframe HTML is properly formatted

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
1. Push to `main` branch triggers GitHub Actions workflow (`.github/workflows/release-main.yml`)
2. Workflow uses weekly cache (`mkdocs-material-{week_number}`) for faster builds
3. Installs dependencies via `.devcontainer/requirements.sh`
4. Builds site with `mkdocs build --site-dir _site/`
5. Deploys to GitHub Pages at https://guides.worldwaronline.com/

Note: The workflow can also be triggered manually via `workflow_dispatch`.

### MkDocs Plugins Used
- `mkdocs-minify-plugin` - HTML minification
- `git-revision-date-localized` - Shows last update dates
- `git-committers` - Shows contributors (only enabled in CI)
- `search` - Site search functionality

Note: YouTube videos are embedded using standard HTML iframes, not a plugin.

### Theme Customization
The site uses Material for MkDocs with custom overrides in `material/overrides/`:
- `main.html` - Extends base template to add PostHog analytics
- `partials/copyright.html` - Custom copyright footer
- `_home.html` - Custom homepage layout

Analytics configuration:
- Google Analytics: Property G-P1RJWYY3T2 (configured in mkdocs.yml)
- PostHog Analytics: Integrated via custom override template (EU instance)

## Working with Game Guide Content

### Navigation Structure
The site navigation is defined in `mkdocs.yml` under the `nav:` section:
- **Home** - Landing page
- **Beginner's Guide** - Introduction and account creation
- **Gameplay** - Main section covering resources, bases, units, battles, squads, leaderboards, store
- **Support** - FAQ and cheating/ban reports

Reports and issues link to GitHub issue chooser: `https://github.com/Chilltime/world-war-online-guides/issues/new/choose`

### Adding New Units
Unit guides follow a consistent pattern with embedded demonstration videos. See `docs/guides/units-normal.md` for examples:
1. Overview paragraph describing the unit type
2. Embedded YouTube playlist iframe with full unit demonstrations
3. Individual unit sections with:
   - Unit name as heading
   - Description and unlock requirements
   - Combat strengths/weaknesses
   - Resource cost
   - Embedded individual unit video

### Resource and Base Documentation
Game mechanics documentation is in `docs/guides/` with interconnected pages for resources, bases, units, and gameplay features.

### Image Assets
Game screenshots and graphics are stored in `docs/assets/images/` using WebP format for optimization.
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

## Communication Guidelines

When asking the user questions or presenting options that require their decision, use the following
formats to ensure they are highly visible and don't get lost in technical output:

### Questions

When you need user input or clarification, format questions like this:

```text
⚠️⚠️⚠️⚠️⚠️⚠️⚠️⁉️💡 Questions ⁉️💡⚠️⚠️⚠️⚠️⚠️⚠️⚠️

Should I create a separate page for this feature or add it to the existing guide?

Do you want me to include video demonstrations for this unit type?
```

### Options

When presenting multiple choices or approaches, format them like this:

```text
⚠️⚠️⚠️⚠️⚠️⚠️⚠️🔀💡 Options 🔀💡⚠️⚠️⚠️⚠️⚠️⚠️⚠️

1. Add to existing units page - Append new unit info to docs/guides/units-normal.md
2. Create dedicated page - New file docs/guides/units-advanced.md with full details
3. Split by category - Reorganize all units into separate files by unit type
```

This ensures questions and options are easily identifiable and don't get lost in technical output.

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

**IMPORTANT**: Always use standard HTML iframe elements for YouTube videos. **DO NOT use the mkdocs-video plugin** - it does not work correctly with our deployment setup.

**Embed individual videos:**
```html
<iframe width="560" height="315" src="https://www.youtube.com/embed/VIDEO_ID"
        frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen></iframe>
```

**Link to YouTube playlists** using standard HTML anchor tags with Material theme classes:
```html
<a href="https://www.youtube.com/playlist?list=PLAYLIST_ID" target="_blank" class="md-button md-button--primary">View Full Playlist on YouTube</a>
```

**Troubleshooting video display issues:**
1. Verify no merge conflicts exist (they prevent GitHub Actions from building)
2. Ensure the video URL uses the `/embed/` format (not `/watch?v=`)
3. Confirm the iframe HTML is properly formatted
4. Check that you're NOT using the mkdocs-video plugin syntax

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

**Important Notes:**
- YouTube videos are embedded using standard HTML iframes, **NOT** the mkdocs-video plugin
- The mkdocs-video plugin does not work correctly with our deployment and should never be used
- Always use the HTML iframe format shown in the YouTube Video Embedding section above

### Theme Customization
The site uses Material for MkDocs with custom overrides in `material/overrides/`:
- `main.html` - Extends base template to add PostHog analytics
- `partials/copyright.html` - Custom copyright footer
- `_home.html` - Custom homepage layout

Analytics configuration:
- Google Analytics: Property G-P1RJWYY3T2 (configured in mkdocs.yml)
- PostHog Analytics: Integrated via custom override template (EU instance)

## Working with Game Guide Content

### Adding New Units
Unit guides follow a consistent pattern with embedded demonstration videos. See `docs/guides/units-normal.md` for examples.

### Resource and Base Documentation
Game mechanics documentation is in `docs/guides/` with interconnected pages for resources, bases, units, and gameplay features.

### Image Assets
Game screenshots and graphics are stored in `docs/assets/images/` using WebP format for optimization.

## Writing Guide for Documentation

**All documentation must follow our established writing standards.** See the comprehensive [Writing Guide](resources/writing-guide.md) for detailed instructions on:

- **Audience and tone**: Writing for our mature, strategic player base (25+ years old)
- **Player-benefit focused writing**: Always frame features from the player advantage perspective
- **Writing style**: Voice, structure, formatting, language conventions
- **Content patterns**: Templates for features, mechanics, and common elements
- **Real examples**: Good and bad examples from our documentation

### Key Principles (Quick Reference)

**Always Lead with Player Benefits:**
- ✅ "Enemy units in districts are now visible, allowing you to scout and plan strategic attacks"
- ❌ "Your units can now be targeted by enemies in districts"

**Use Clear, Mature Communication:**
- Direct and transparent language
- Active voice and second person ("you")
- Specific numbers and values
- Strategic context and tactical depth

**See [resources/writing-guide.md](resources/writing-guide.md) for complete guidelines.**

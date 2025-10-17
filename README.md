# World War Online - Game Guides

Official documentation and game guides for World War Online, built with MkDocs and deployed via GitHub Pages.

**Live Site:** https://guides.worldwaronline.com/

## About

This repository contains comprehensive gameplay guides, unit information, and strategic tips for World War Online players. The documentation is built using MkDocs with the Material theme and includes embedded video tutorials.

## Prerequisites

- Python 3.x
- pip (Python package manager)
- Git

## Local Development

### 1. Install Dependencies

```bash
# Install MkDocs Material theme
pip install mkdocs-material

# Install additional required packages
bash .devcontainer/requirements.sh
```

### 2. Run Development Server

```bash
python3 -m mkdocs serve
```

This will start a local server at `http://127.0.0.1:8000` with live reloading. Any changes you make to the documentation will automatically refresh in your browser.

### 3. Build Static Site

To build the static site files for production:

```bash
mkdocs build --site-dir _site/
```

The built site will be available in the `_site/` directory.

## Project Structure

```
.
├── docs/                    # Documentation content
│   ├── guides/             # Game guides and tutorials
│   ├── legal/              # Legal documents and rules
│   ├── faq/                # Frequently asked questions
│   └── assets/images/      # Image assets
├── material/overrides/     # Theme customizations
├── mkdocs.yml              # MkDocs configuration
└── .github/workflows/      # GitHub Actions CI/CD
```

## Testing Your Changes

### Local Testing

1. **Start the dev server**: `python3 -m mkdocs serve`
2. **Navigate to**: `http://127.0.0.1:8000`
3. **Check**:
   - All pages load correctly
   - Navigation works properly
   - Videos are embedded and playable
   - Images display correctly
   - Links are not broken

### Build Testing

Before creating a pull request, verify the site builds successfully:

```bash
mkdocs build --site-dir _site/
```

If the build completes without errors, your changes are ready for review.

### Common Issues

- **Videos not showing**: Ensure YouTube embeds use the `/embed/` URL format
- **Build failures**: Check for merge conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`)
- **Missing dependencies**: Re-run `bash .devcontainer/requirements.sh`

## Contributing

We welcome contributions to improve the World War Online documentation! There are two ways to contribute:

### Option 1: Request Documentation Updates (No Code Required)

If you've found outdated information, missing guides, or want to suggest improvements without making changes yourself:

1. **Visit the issue tracker**: https://github.com/Chilltime/world-war-online-guides/issues/new/choose
2. **Select the appropriate issue template**:
   - Bug report for incorrect information
   - Feature request for new guides or content
   - General issue for other suggestions
3. **Provide details**:
   - What page or section needs updating
   - What information is incorrect or missing
   - Suggested improvements (if applicable)
   - Screenshots or examples (if helpful)

Our maintainers will review your request and make the necessary updates.

### Option 2: Submit Changes Directly (Code Contribution)

If you're comfortable with Git and Markdown, you can contribute changes directly:

#### Step 1: Fork and Clone

```bash
# Fork this repository on GitHub, then clone your fork
git clone https://github.com/YOUR-USERNAME/world-war-online-guides.git
cd world-war-online-guides
```

#### Step 2: Set Up Your Environment

```bash
# Install dependencies
pip install mkdocs-material
bash .devcontainer/requirements.sh
```

#### Step 3: Create a Branch

```bash
# Create a descriptive branch name
git checkout -b update-unit-guide
# or
git checkout -b fix-typo-resources-page
```

#### Step 4: Make Your Changes

Edit the relevant Markdown files in the `docs/` directory:

- **Game guides**: `docs/guides/`
- **FAQ content**: `docs/faq/`
- **Legal documents**: `docs/legal/`

**Content Guidelines**:
- Use clear, concise language
- Follow existing formatting patterns
- Only include public game information (no internal mechanics)
- Add images to `docs/assets/images/` (prefer WebP format)
- Use proper Markdown syntax

#### Step 5: Test Locally

```bash
# Start the development server
python3 -m mkdocs serve

# Open http://127.0.0.1:8000 in your browser
# Verify your changes look correct
```

**Pre-submission checklist**:
- [ ] All pages load without errors
- [ ] Navigation works correctly
- [ ] Videos play properly (if modified)
- [ ] Images display correctly
- [ ] No broken links
- [ ] Build completes successfully: `mkdocs build --site-dir _site/`

#### Step 6: Commit Your Changes

```bash
# Stage your changes
git add .

# Commit with a descriptive message
git commit -m "Update infantry unit stats in combat guide"
```

#### Step 7: Push and Create Pull Request

```bash
# Push to your fork
git push origin your-branch-name
```

Then:
1. Visit your fork on GitHub
2. Click "Compare & pull request"
3. Fill out the PR template with:
   - Clear description of changes
   - Why the changes are needed
   - Any relevant screenshots
4. Submit the pull request

Our team will review your contribution and provide feedback or merge it.

### Contribution Guidelines

- **Content focus**: Player-facing game information only (guides, tips, strategies)
- **No sensitive data**: Don't include internal game mechanics or confidential information
- **Quality standards**: Follow existing writing style and formatting
- **Testing required**: Always test locally before submitting
- **One topic per PR**: Keep pull requests focused on a single topic or fix

### Questions?

If you have questions about contributing, feel free to:
- Open an issue to ask: https://github.com/Chilltime/world-war-online-guides/issues/new
- Check existing issues for similar questions
- Review the [CLAUDE.md](.claude/CLAUDE.md) file for technical details

## Deployment

The site is automatically deployed to GitHub Pages when changes are pushed to the `main` branch via GitHub Actions.

**Deployment workflow**: `.github/workflows/release-main.yml`

## Technology Stack

- **[MkDocs](https://www.mkdocs.org/)** - Static site generator
- **[Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)** - Theme
- **[GitHub Pages](https://pages.github.com/)** - Hosting
- **[GitHub Actions](https://github.com/features/actions)** - CI/CD

### MkDocs Plugins

- `mkdocs-minify-plugin` - HTML minification
- `git-revision-date-localized` - Last update dates
- `git-committers` - Contributor information
- `search` - Site search functionality

## Analytics

- **Google Analytics**: Property G-P1RJWYY3T2
- **PostHog Analytics**: EU instance integration

## Security Notes

⚠️ **This is a public repository**

- Keep sensitive settings in `.claude/settings.local.json` (gitignored)
- Never commit API keys, tokens, or personal credentials
- Only include public game information in documentation

## Support

- **Report Issues**: https://github.com/Chilltime/world-war-online-guides/issues/new/choose
- **Game Support**: See the FAQ section on the live site

## License

See [legal documentation](docs/legal/) for terms of use and game rules.

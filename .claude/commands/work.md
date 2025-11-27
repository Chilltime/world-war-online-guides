---
description: Complete issue resolution workflow for documentation
---

# /work - Complete Issue Resolution Workflow

Automatically resolve GitHub issues from start to finish: read issue, implement changes, validate build, and create PR.

**IMPORTANT SECURITY REMINDER**: This is a PUBLIC repository. Only include player-facing, public game information. Never expose internal game mechanics, private systems, or confidential information.

## Usage

```
/work [<issue-number-or-url>]
```

**Examples:**
- `/work` - Will prompt for issue number or URL
- `/work 42` - Resolve single issue by number
- `/work https://github.com/Chilltime/world-war-online-guides/issues/42` - Resolve by URL

## Workflow Steps

Execute the following steps in order for the single issue:

### Step 1: Request Issue Information
1. **Check if issue number or URL provided**:
   - If no arguments provided: **ASK** the user: "Which issue would you like me to work on? Please provide an issue number or GitHub issue URL."
   - Wait for user response with issue number or URL
   - Once received, continue to Step 2

### Step 2: Parse and Validate Input
1. **Parse the input**:
   - If GitHub URL provided (e.g., `https://github.com/Chilltime/world-war-online-guides/issues/42`): Extract issue number
   - If just a number provided (e.g., `42`): Use directly
   - **Only support ONE issue at a time**
2. **Validate the issue belongs to the correct repository**:
   - Repository must be: `https://github.com/Chilltime/world-war-online-guides`
   - Use `gh issue view {issue-number} --json url,title` to verify
   - If URL doesn't match the expected repository, **STOP** and report: "Issue #{number} is not from the world-war-online-guides repository."
3. **Continue to Step 3** with validated issue number

### Step 3: Fetch and Read Issue
1. **Fetch the issue** using `gh issue view {issue-number}`
2. **Read the issue details**:
   - Title
   - Description/Body
   - Labels
   - Comments (if any)
   - Acceptance criteria
3. **Display issue summary** to user:
   - Issue number and title
   - Brief description of what needs to be done
   - Key requirements or acceptance criteria

### Step 4: Prepare Development Environment
**CRITICAL**: Before making ANY file changes, prepare the git environment:

1. **Switch to main branch**:
   - Run `git checkout main`
   - Verify you're on main branch
2. **Pull latest changes**:
   - Run `git pull origin main`
   - Ensure your main branch is up to date with remote
3. **Create feature branch** with proper naming convention:
   - Branch naming format: `{type}/{issue-number}-{brief-description}`
   - Types: `docs/`, `fix/`, `feature/`
   - Example: `docs/42-country-awards` or `fix/43-broken-video`
   - Use the issue label to determine branch type:
     - `bug` label → `fix/`
     - `documentation` label → `docs/`
     - `enhancement` label → `feature/`
     - Default to `docs/` if no label or unclear
   - Keep description brief (2-4 words max), use kebab-case
   - Run `git checkout -b {branch-name}`
4. **Verify branch creation**:
   - Confirm you're on the new branch
   - **DO NOT proceed to implementation** until this step is complete

### Step 5: Create Plan and Implement
1. **Use TodoWrite** to create a detailed implementation plan based on the issue requirements
2. **Implement the solution**:
   - Make all necessary documentation changes
   - Follow the issue requirements exactly
   - Adhere to all guidelines from CLAUDE.md
   - **Follow the Writing Guide** (`.claude/resources/writing-guide.md`):
     - Lead with player benefits
     - Use clear, mature communication
     - Be objective and factual
     - No backstories or potentially liable claims
   - **Keep in mind security guidelines**:
     - Only player-facing, public information
     - No internal game mechanics or confidential data
     - Review all changes for sensitive content
   - **For video embeds**: Always use HTML iframe format (never mkdocs-video plugin)
   - Update navigation in `mkdocs.yml` if adding new pages
3. **Mark todos as completed** as you finish each implementation step

### Step 6: Validate Documentation Build
1. **Run MkDocs build** to ensure site builds correctly:
   - Run `python3 -m mkdocs build --site-dir _site/`
   - If build fails, analyze errors and fix immediately
   - Common issues to check:
     - Merge conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`)
     - Invalid YAML in mkdocs.yml
     - Broken markdown formatting
     - Missing files or images
2. **Re-run build** after fixes until it succeeds
3. **Only proceed to Step 7** when build succeeds

### Step 7: Request Permission and Push
1. **Display changes summary** to user:
   - Show all modified files
   - Briefly describe what was changed
   - Confirm build succeeded
2. **Ask for user confirmation** before proceeding:
   - "The implementation is complete and the build succeeded. Would you like me to run `/push` to commit the changes and create a PR?"
   - **WAIT for user response**
   - If user says yes/confirms: Proceed to step 3
   - If user says no/declines: Skip to Step 8 without pushing
3. **Run the /push command** to create PR (only if user confirmed):
   - Git commit with clear message
   - Git push to remote
   - PR creation with proper template
4. **The /push command will**:
   - Review all changes for sensitive information
   - Create comprehensive PR description
   - Include security reminders
   - Generate changelog summary
5. **Once /push succeeds** (or if user declined), proceed to Step 8

### Step 8: Final Summary Report
Provide a concise summary of the completed work:

```markdown
## 🎉 Work Complete: Issue #{issue-number}

**Issue**: {Issue Title}
**PR**: {PR URL}

### Changes Made
- {Bullet point of main change 1}
- {Bullet point of main change 2}
- {Bullet point of main change 3}

### Files Modified
- `docs/path/to/file.md` - {brief description of changes}
- `mkdocs.yml` - {brief description of changes}

### Quality Checks
✓ MkDocs build successful
✓ No merge conflicts
✓ Security review completed (public content only)
✓ Writing guide compliance
✓ Code committed and pushed
✓ PR created and ready for review
```

## Important Notes

- **Single issue only**: This command handles ONE issue at a time
- **Security first**: Always verify no sensitive information is included
- **Use TodoWrite**: Track all implementation steps for the issue
- **Writing guide**: Follow `.claude/resources/writing-guide.md` for all content
- **Build validation**: Always run `mkdocs build` before pushing
- **Error handling**:
  - If issue doesn't exist: Report error and stop
  - If build fails: Fix issues and re-run build until it succeeds
  - If /push fails: The push command will handle fixes
- **Auto-approved commands**: All git, gh, mkdocs, and slash commands can run without asking
- **Be objective**: No backstories, no potentially liable claims, focus on facts
- **Be autonomous**: Execute the workflow autonomously, only stopping to ask for push confirmation

## Communication Format

When asking questions or presenting options, use the eye-catching format from CLAUDE.md:

**Questions:**
```text
⚠️⚠️⚠️⚠️⚠️⚠️⚠️⁉️💡 Questions ⁉️💡⚠️⚠️⚠️⚠️⚠️⚠️⚠️

Your question here?
```

**Options:**
```text
⚠️⚠️⚠️⚠️⚠️⚠️⚠️🔀💡 Options 🔀💡⚠️⚠️⚠️⚠️⚠️⚠️⚠️

1. Option one - Brief description
2. Option two - Brief description
```

This ensures questions and options don't get lost in technical output.

## Constants Reference

- **Repository**: Chilltime/world-war-online-guides
- **Issues URL**: https://github.com/Chilltime/world-war-online-guides/issues
- **Site URL**: https://guides.worldwaronline.com/
- **Build Command**: `python3 -m mkdocs build --site-dir _site/`
- **Dev Server**: `python3 -m mkdocs serve`

## Common Documentation Patterns

**Video Embeds** - Always use HTML iframe format:
```html
<iframe width="560" height="315" src="https://www.youtube.com/embed/VIDEO_ID"
        frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen></iframe>
```

**Playlist Links** - Use Material theme button classes:
```html
<a href="https://www.youtube.com/playlist?list=PLAYLIST_ID" target="_blank" class="md-button md-button--primary">View Full Playlist on YouTube</a>
```

**Navigation Updates** - Edit `mkdocs.yml`:
```yaml
nav:
  - Home: index.md
  - Guides:
      - New Guide: guides/new-guide.md
```

## See Also

- `.claude/CLAUDE.md` - Project instructions and guidelines
- `.claude/resources/writing-guide.md` - Documentation writing standards
- `.claude/commands/push.md` - PR creation workflow
- `.claude/commands/issue.md` - Issue creation workflow

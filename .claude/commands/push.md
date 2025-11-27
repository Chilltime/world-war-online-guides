---
description: Push changes and create pull request
---

You are about to create a pull request for a **public repository** (World War Online Guides). Follow these steps:

## Important Security Guidelines

**CRITICAL**: This is a PUBLIC repository. Before proceeding:
- ✅ ONLY include information suitable for public documentation
- ❌ NEVER include private game mechanics, internal systems, or confidential information
- ❌ NEVER include API keys, credentials, or sensitive configuration
- ✅ Focus on player-facing features and public game information
- ✅ Review all changes to ensure they don't expose internal game details

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

## Steps to Create PR

1. **Review All Changes**:
   - Run `git status` and `git diff` to see uncommitted changes
   - Run `git log origin/main..HEAD` to see all commits in the current branch
   - Run `git diff origin/main...HEAD` to see the full diff from main

2. **Analyze Changes**:
   - Summarize what documentation was added/updated
   - List all modified files
   - Verify no sensitive information is included
   - Check for any merge conflicts or formatting issues

3. **Create Pull Request**:
   - Push the current branch to remote with `git push -u origin [branch-name]`
   - Use `gh pr create` with the PR template format below
   - Include a clear title summarizing the changes
   - Fill in the changelog with a clear summary of all commits

## PR Template Format

Use this format when creating the PR:

```
## Task:

Resolves #[issue-number if applicable, otherwise remove this line]

## Changelog:

[Provide a clear, structured summary of all changes:
- Documentation updates
- New features or sections added
- Bug fixes
- Navigation or structure changes
- Any breaking changes or important notes]

## Screenshots / Videos:

[If applicable, mention if screenshots should be added or are not needed]

## Follow up tasks:

- [List any remaining work or future improvements]
- [Or state "None" if complete]
```

## Example PR Creation Command

```bash
gh pr create --title "Your PR Title Here" --body "$(cat <<'EOF'
## Task:

Brief description of what this PR accomplishes

## Changelog:

- Updated FAQ with browser-only access information
- Added Progressive Web App installation instructions
- Reorganized navigation: moved Community under Gameplay
- Consolidated report links to GitHub issue chooser

## Screenshots / Videos:

Not applicable - documentation changes only

## Follow up tasks:

None
EOF
)"
```

Now proceed to create the pull request following these steps.

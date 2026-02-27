---
description: Create a GitHub issue for documentation improvements
---

# /issue - Create GitHub Issue

Create a new GitHub issue for documentation improvements, bug fixes, or new content.

**IMPORTANT SECURITY REMINDER**: This is a public repository. Only include player-facing, public game information. Never expose internal game mechanics, private systems, or confidential information in issues.

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

## Instructions

Follow these steps in order:

### Step 1: Gather Issue Information

Ask the user for the issue details with a clear, structured prompt:

```
I'll help you create a GitHub issue for the documentation. Please provide the following information:

**Type**: (Bug, Documentation, Enhancement)
- **Bug**: Typos, broken links, incorrect information, formatting issues, build errors
- **Documentation**: New guides, major content additions, documentation improvements
- **Enhancement**: Enhancing existing docs, better examples, clarity improvements, restructuring

**Objective**: (What documentation needs to be created/updated?)

**Scope**: (What content areas, mechanics, or features does this cover?)

**Pages Affected**: (Which documentation pages are involved?)

**Acceptance Criteria**: (Checklist of requirements - I'll format these)

**Implementation Details** (optional): (Specific files, sections, or technical details)

**Related Issues** (optional): (Any related issue numbers like #123)

---
You can also provide this as a simple description and I'll help structure it.
```

### Step 2: Generate Title and Create the Issue

**IMPORTANT**: Before creating the issue, generate a clear, actionable title based on the issue content:

1. Analyze the description, desired outcome, and acceptance criteria
2. Generate a title that:
   - Starts with a verb (Add, Create, Update, Fix, Improve, Document, etc.)
   - Is concise but descriptive (5-10 words)
   - Clearly describes what will be done
   - Focuses on the documentation aspect

**Examples of good titles**:
- "Add advanced tactics section to Capital Warfare guide"
- "Fix broken YouTube video embeds in Units guide"
- "Update Battle Rules with new mechanics"
- "Improve navigation structure for mobile users"
- "Document new resource gathering features"

Do NOT ask the user to provide a title - generate it automatically from the content.

**IMPORTANT**: Do NOT ask for approval before creating the issue. Once you have the information and generated the title, create the issue immediately without confirmation prompts.

**Label Mapping** (use lowercase for the `--label` flag):
- Bug → `--label "bug"`
- Documentation → `--label "documentation"`
- Enhancement → `--label "enhancement"`

```bash
gh issue create --title "Issue Title" --label "LABEL" --body "$(cat <<'EOF'
## Type
[Bug/Documentation/Enhancement]

## Objective
[What documentation needs to be created or updated]

## Scope
[What content areas, mechanics, or features this covers]

## Pages Affected
[Which documentation pages are involved]

## Acceptance Criteria
- [ ] Requirement 1
- [ ] Requirement 2
- [ ] Requirement 3

## Implementation Details
[Specific technical details:
- Files to create or update (e.g., docs/guides/new-guide.md)
- Sections to modify (line numbers if known)
- Content structure or tables needed
- Navigation changes in mkdocs.yml
- Assets needed (videos, images, etc.)

Example:
**Files to Update:**
- `docs/guides/units-normal.md` - Add new unit section after line 42
- `mkdocs.yml` - Update navigation structure

**Content Structure:**
- Introduction paragraph
- Strategy comparison table
- Tactical tips section

**Assets Needed:**
- YouTube video embed for unit demonstration
- Screenshot images (WebP format)]

## Related Issues
[If any - e.g., Related to #123, Fixes #456]

---
🤖 **Created by Claude Code** - This issue was automatically generated to track documentation improvements.

**Security Reminder**: This is a public repository. Ensure all content is player-facing and does not expose internal game mechanics or confidential information.
EOF
)"
```

This returns the issue URL (e.g., `https://github.com/Chilltime/world-war-online-guides/issues/42`)

### Step 3: Confirm Success

Report back to the user with:

```
✅ Issue created successfully!

**Issue**: [#ISSUE_NUMBER](ISSUE_URL)
**Title**: [Issue Title]
**Type**: [bug/content/improvement/maintenance]
**Repository**: https://github.com/Chilltime/world-war-online-guides

View all issues: https://github.com/Chilltime/world-war-online-guides/issues
```

Then provide a concise work summary in 3-5 bullet points:

```
## Work Summary
• [Main task 1 - most important work]
• [Main task 2]
• [Main task 3]
• [Main task 4 if needed]
• [Main task 5 if needed]
```

**Guidelines for summary bullets**:
- Keep each bullet to one line (max 10-15 words)
- Focus on the documentation changes needed
- List in order of implementation priority
- Use action verbs (Add, Update, Fix, Create, Document, Improve)
- Omit excessive technical details
- If less than 5 tasks, only list what's necessary

## Constants Reference

- **Repository**: Chilltime/world-war-online-guides
- **Issues URL**: https://github.com/Chilltime/world-war-online-guides/issues
- **Site URL**: https://www.worldwaronline.com/guides/

## Labels Reference

| Type          | Label             | Description                                                                   |
| ------------- | ----------------- | ----------------------------------------------------------------------------- |
| Bug           | `bug`             | Typos, broken links, incorrect information, formatting issues, build errors   |
| Documentation | `documentation`   | New guides, major content additions, documentation improvements               |
| Enhancement   | `enhancement`     | Enhancing existing docs, better examples, clarity improvements, restructuring |

## Important Notes

- **Security First**: Always remind users this is a public repository
- Never include internal game mechanics or confidential information
- Focus on player-facing, public documentation
- Use the TodoWrite tool to track progress through all steps
- Extract the issue number from the URL returned
- If creation fails, report the error clearly and stop
- Double-check that video embeds use HTML iframe format (not mkdocs-video plugin)
- Remind users to check for merge conflicts if build issues are reported

## Common Documentation Issue Patterns

**Broken Videos**: Check for:
- Merge conflict markers in markdown files
- Incorrect video URL format (should be `/embed/` not `/watch?v=`)
- mkdocs-video plugin usage (should use HTML iframe instead)

**Build Failures**: Check for:
- Merge conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`)
- Invalid YAML in mkdocs.yml
- Missing dependencies in requirements.sh

**Content Updates**: Consider:
- Following the writing guide (resources/writing-guide.md)
- Player-benefit focused language
- Consistent formatting with existing guides
- Proper navigation updates in mkdocs.yml

## Example Usage

**User**: `/issue`

**Claude**: "I'll help you create a GitHub issue for the documentation. Please provide the following information: [shows structured prompt]"

**User**: "The Infantry unit video is broken on the units-normal.md page"

**Claude**:
1. Generates title: "Fix broken Infantry unit video embed in Normal Units guide"
2. Structures information into bug report
3. Creates issue with `gh issue create --label "bug"`
4. Adds security reminder about public repository
5. Reports success with issue link and work summary

## See Also

- `.claude/CLAUDE.md` - Project instructions and guidelines
- `resources/writing-guide.md` - Documentation writing standards
- `mkdocs.yml` - Site configuration

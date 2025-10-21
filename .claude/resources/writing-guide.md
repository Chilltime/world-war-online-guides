# Writing Guide for World War Online Documentation

This guide establishes the writing standards and principles for all World War Online game documentation.

## Audience and Tone

World War Online is an international strategy war game where players represent their countries in competition against players from around the world. Our documentation reflects the mature, strategic nature of the game and its community.

### Target Audience

- **Mature player base** (predominantly 25+ years old)
- **Strategic thinkers** who value depth and clarity
- **International community** from diverse backgrounds
- **Players who appreciate** transparency and respect

### Communication Principles

- **Clear and Transparent**: Use straightforward language without ambiguity
- **Mature Tone**: Professional, respectful, and informative without being condescending
- **Direct**: Get to the point efficiently; respect players' time
- **Empowering**: Focus on what players can do, not what they can't

## Player-Benefit Focused Writing

**CRITICAL PRINCIPLE**: Always frame features and mechanics from the perspective of how they benefit the player and enhance gameplay experience.

### ✅ Good Examples

- "Enemy units in districts are now visible, allowing you to scout and plan strategic attacks"
- "Your bases automatically set up defenses using your strongest available units, ensuring you're never left vulnerable"
- "Generals don't count toward your 6-unit group limit, giving you more tactical flexibility"
- "Supreme units have significantly higher carrying capacity, making them ideal for resource raids"

### ❌ Avoid

- "Your units can now be targeted by enemies in districts"
- "We've added automatic defenses because players were leaving bases undefended"
- "Generals no longer take up a unit slot"
- "Supreme units were buffed to carry more resources"

### Key Principles

1. **Lead with the player advantage** or strategic opportunity
2. **Emphasize control and choice** - use phrases like:
   - "you can"
   - "allowing you to"
   - "giving you"
   - "enabling you to"
3. **Frame limitations as strategic considerations** rather than restrictions
4. **Focus on what's gained** rather than what's removed or changed
5. **Highlight strategic depth** and tactical options

## Writing Style Guidelines

### Voice and Perspective

- **Use second person** ("you", "your") to directly address the player
- **Active voice** preferred over passive voice
- **Present tense** for current game mechanics
- **Use "player"** when referring to others, "you" when addressing the reader

**Examples:**
- ✅ "You can attack each player in a specific district up to 3 times per 12 hours"
- ❌ "Each player can be attacked 3 times per 12 hours in each district"

### Structure

- **Start with a clear, descriptive header**
- **Lead with the most important information** (inverted pyramid style)
- **Use bullet points** for lists and key features
- **Include specific numbers** and values where relevant
- **Cross-reference related topics** with markdown links

### Formatting Conventions

- **Bold** (`**text**`) for emphasis on key terms, features, or important warnings
- *Italics* (`*text*`) sparingly, mainly within quotes
- `Code formatting` (`` `text` ``) only for technical terms or specific UI element names when necessary
- Use markdown tables for stat comparisons and data
- Section headers follow sentence case (capitalize first word only, except proper nouns)

### Language Style

- **Avoid jargon** unless it's established game terminology
- **Define acronyms** on first use (e.g., "WWO-Influence (premium currency)")
- **Use inclusive language** ("players" not "guys")
- **Keep sentences concise** but complete
- **Avoid unnecessary adjectives** and superlatives
- **Be specific** rather than vague

**Examples:**
- ✅ "Each non-capital base provides capacity for 10,000 units"
- ❌ "Bases provide a lot of unit capacity"

### Technical Accuracy

- **Always include specific numbers** (costs, timers, limits, capacities)
- **Verify game mechanics** before documenting
- **Update documentation** when mechanics change
- **Cross-check related pages** for consistency
- **Test features** when possible before documenting

## Content Organization Patterns

### Feature Introduction Pattern

```markdown
## Feature Name

[Opening sentence explaining what it is and why it matters to players]

Key benefits or strategic advantages:
- **Benefit 1**: Explanation focusing on player advantage
- **Benefit 2**: How this helps gameplay
- **Benefit 3**: Strategic opportunity this creates

[Additional details, mechanics, or usage instructions]
```

**Real Example from Capital Warfare:**
```markdown
## Progressive Point Multipliers

Capital points now use a progressive multiplier system that increases as 
the season approaches its end, making the final weeks more strategic and 
competitive:

- **Final week** (≤8 days before season end): **4x multiplier**
- **Second-to-last week** (≤15 days before season end): **3x multiplier**
- **Third-to-last week** (≤22 days before season end): **2x multiplier**
```

### Mechanic Explanation Pattern

```markdown
## Mechanic Name

[Brief description of what it does]

- **Key Aspect**: Specific value or behavior
- **Strategic Use**: How players can leverage this
- **Important Note**: Any limitations or considerations

[Examples or scenarios where relevant]
```

**Real Example from Resources:**
```markdown
## Resource Stealing and Carrying Capacity

When you successfully attack enemy bases, you can steal their resources. 
The amount you can carry is now directly tied to your unit composition:

- **Carrying Capacity**: Each unit can carry resources equal to **5% of 
  its total health**
- **Strategic Unit Selection**: Heavier units (like Dongfeng with 225 HP) 
  can carry more resources (11.25 per unit) than lighter units
- **Supreme Unit Advantage**: Supreme units have significantly higher 
  carrying capacity
```

## Common Documentation Elements

### Stats Tables

- **Always include headers** with clear column descriptions
- **Center-align numbers** for easier scanning (`:---:`)
- **Include units of measurement** (per hour, per unit, etc.)
- **Keep formatting consistent** across all tables
- **Use markdown table syntax** properly

**Example:**
```markdown
| Unit | Iron Cost | Min Rank | Max Units | Health Points | Steal Capacity |
|:----:|:---------:|:--------:|:---------:|:-------------:|:--------------:|
| Akula | 28 | 8 | 10,000 | 190 | 9.5 |
```

### Cross-References

- **Link to related topics** using descriptive text: `[Capital Warfare](capital-warfare.md)`
- **Don't use "click here"** or generic link text
- **Ensure bidirectional linking** where topics are related
- **Use relative paths** for internal links
- **Keep link text natural** within the sentence

**Examples:**
- ✅ "Learn more about [Squad roles and permissions](squads.md#squad-roles)"
- ❌ "Click [here](squads.md) for more information"

### Visual Elements

- **Every major page should have a header image**
- **Use descriptive alt text** for accessibility
- **Reference images** that illustrate concepts being discussed
- **Keep image file sizes optimized** (WebP format preferred)
- **Store images** in `docs/assets/images/`

**Image Format:**
```markdown
![Descriptive alt text](../assets/images/image-name.webp "Image title")
```

### Video Embedding

**IMPORTANT**: Always use standard HTML iframe elements for YouTube videos. DO NOT use the mkdocs-video plugin.

**Embed Format:**
```html
<iframe width="560" height="315" 
        src="https://www.youtube.com/embed/VIDEO_ID"
        frameborder="0" 
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen></iframe>
```

**Playlist Button Format:**
```html
<a href="https://www.youtube.com/playlist?list=PLAYLIST_ID" 
   target="_blank" 
   class="md-button md-button--primary">
   View Full Playlist on YouTube
</a>
```

## Examples from Current Documentation

### Good Player-Benefit Framing

> "Districts containing your Headquarters provide enhanced defensive capabilities: 8 unit groups can be positioned for defense (instead of the standard 6)"

**Why this works:**
- Leads with the benefit ("enhanced defensive capabilities")
- Specific numbers included
- Frames as an advantage to the player

### Clear, Direct Instruction

> "To Conquer a base, the General must survive the outcome of the battle."

**Why this works:**
- Concise and unambiguous
- Active voice
- Critical information clearly stated

### Mature, Transparent Communication

> "This system encourages territorial expansion as a core strategic element while allowing you to invest in elite Supreme units without restriction."

**Why this works:**
- Explains the design intent transparently
- Uses mature, thoughtful language
- Focuses on strategic depth

### Strategic Framing

> "Choose your attack force based on your objectives - use heavier units when raiding for resources"

**Why this works:**
- Empowers player choice
- Provides actionable strategic advice
- Connects mechanics to tactics

## Common Mistakes to Avoid

### ❌ Don't Focus on Negatives

**Bad:** "You can no longer spam attacks on the same player"
**Good:** "Strategic attack timing is now rewarded with a 12-hour cooldown system per district"

### ❌ Don't Use Developer Perspective

**Bad:** "We've changed the unit cap to be base-dependent"
**Good:** "Your maximum trainable units now scales with territorial control"

### ❌ Don't Be Vague

**Bad:** "Supreme units are better for raiding"
**Good:** "Supreme units can carry up to 200 resources each (5% of their 4,000 HP)"

### ❌ Don't Overexplain Simple Concepts

**Bad:** "When you want to move units, you need to click on the unit flag, then select move, then drag your cursor to the destination location on the map where you want them to go"
**Good:** "Click your unit flag and drag to your destination to move units"

### ❌ Don't Use Marketing Language

**Bad:** "Experience the ultimate strategic warfare with our amazing new feature!"
**Good:** "Plan multi-front conflicts across different districts with the new targeting system"

## Content Review Checklist

Before publishing or updating documentation, verify:

- [ ] **Player-benefit framing**: Features described from player advantage perspective
- [ ] **Specific numbers included**: All costs, limits, timers, and values stated clearly
- [ ] **Active voice used**: Sentences structured with player as subject
- [ ] **Cross-references added**: Related topics linked appropriately
- [ ] **Technical accuracy verified**: Mechanics tested or confirmed
- [ ] **Consistent formatting**: Tables, lists, and headers follow standards
- [ ] **Images included**: Relevant screenshots or graphics added
- [ ] **Clear structure**: Information organized logically
- [ ] **Mature tone**: Professional and respectful language throughout
- [ ] **Strategic context**: Explains not just what, but why it matters

## Additional Resources

- See existing guides in `docs/guides/` for reference examples
- Check `mkdocs.yml` for navigation structure
- Review recent pull requests for approved documentation patterns
- Consult patch notes for accurate feature descriptions

---

**Remember**: Our players are strategic thinkers who deserve clear, empowering, and respectful documentation that helps them master the complexities of World War Online.

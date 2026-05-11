---
name: design-md
description: Generates a DESIGN.md file strictly following the google-labs-code/design.md specification from one or more page screenshots. Use this skill whenever the user provides screenshots and asks to create a DESIGN.md, generate a design spec, document the UI design system, extract design tokens from a screenshot, or create a design reference for frontend implementation. Trigger on phrases like "make a DESIGN.md", "create a design spec", "document the design system", "write design tokens from these screenshots", or "generate a design document from this UI".
---

# design-md

Generate a `DESIGN.md` that gives AI coding agents a persistent, structured understanding of a design system — combining machine-readable tokens (YAML frontmatter) with human-readable rationale (Markdown body). The format is defined by [google-labs-code/design.md](https://github.com/google-labs-code/design.md).

The goal is not just to transcribe what you see — it's to articulate *why* the design choices create the intended brand voice, so future agents can extrapolate and stay on-brand even in situations not covered by the screenshots.

## Process

### 1. Analyze the screenshots

Study each screenshot carefully. Extract:

- **Colors**: Background, text, interactive states, accents. Estimate hex values from visual inspection — aim for 2-digit accuracy (e.g., `#cc785c` not `#cc0000`).
- **Typography**: Font families (or likely substitutes), sizes, weights, line heights, letter spacing for each role (display headlines, body, captions, buttons, nav links, code).
- **Spacing**: Base unit (usually 4px or 8px) and the scale derived from it.
- **Border radius**: Values for different element types (buttons, cards, badges, inputs).
- **Components**: Identify each named UI element and its visual properties.
- **Layout**: Grid columns, max-width, section padding, card padding.
- **Elevation**: Whether depth is expressed via shadows, color-block contrast, or borders.

When a value is ambiguous, make your best visual estimate and note it's approximate. Don't skip sections because you're uncertain — an educated guess beats silence.

### 2. Write the YAML frontmatter

Open the file with `---` delimiters. All component properties must use token references (`{colors.primary}`), never raw hex values.

```yaml
---
version: alpha
name: <product-name>
description: <2–3 sentence brand narrative — dominant atmosphere, type voice, key color pairing, design philosophy>

colors:
  primary: "#hex"
  primary-active: "#hex"
  primary-disabled: "#hex"
  ink: "#hex"
  body: "#hex"
  body-strong: "#hex"
  muted: "#hex"
  muted-soft: "#hex"
  hairline: "#hex"
  canvas: "#hex"
  surface-soft: "#hex"
  surface-card: "#hex"
  surface-dark: "#hex"
  on-primary: "#hex"
  on-dark: "#hex"
  # Add/remove tokens to match what the design actually uses

typography:
  display-xl:
    fontFamily: "FontName, fallback, serif"
    fontSize: 64px
    fontWeight: 400
    lineHeight: 1.05
    letterSpacing: -1.5px
  # Include all observed roles: display-lg/md/sm, title-lg/md/sm,
  # body-md/sm, caption, button, nav-link, code

rounded:
  xs: 4px
  sm: 6px
  md: 8px
  lg: 12px
  xl: 16px
  pill: 9999px
  # Adjust values to match observed radii

spacing:
  xxs: 4px
  xs: 8px
  sm: 12px
  md: 16px
  lg: 24px
  xl: 32px
  xxl: 48px
  section: 96px
  # Adjust values to match observed spacing

components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.button}"
    rounded: "{rounded.md}"
    padding: 12px 20px
    height: 40px
  # Add each named component observed in the screenshots.
  # Valid component properties: backgroundColor, textColor, typography,
  # rounded, padding, size, height, width
---
```

See `references/format-spec.md` for the complete token type reference.

### 3. Write the Markdown body

Follow this canonical section order (omit sections not relevant to the design):

```
## Overview
## Colors
## Typography
## Layout
## Elevation & Depth
## Shapes
## Components
## Do's and Don'ts
## Responsive Behavior
## Iteration Guide
## Known Gaps
```

**Overview** — Brand vision paragraph: dominant surface, type voice, color pairing rationale, design philosophy. Explain *why* the choices create the intended feeling. End with a **Key Characteristics** bullet list of the most distinctive visual traits.

**Colors** — Group by role (Brand & Accent, Surface, Text, Semantic). For each token: name, token ref, hex, and a usage description explaining *when and where* it appears.

**Typography** — Font family pairing rationale, a hierarchy table (`| Token | Size | Weight | Line Height | Letter Spacing | Use |`), and principles explaining *why* the choices work. Note font substitutes if the primary faces are licensed/unavailable.

**Layout** — Spacing system (base unit, key tokens), grid & container (max-width, column system), whitespace philosophy.

**Elevation & Depth** — Table of levels (Flat → Hairline → Card → Shadow). Explain whether depth is expressed via color-block contrast, borders, or shadows.

**Shapes** — Border radius scale table (`| Token | Value | Use |`). Photography/illustration conventions.

**Components** — One subsection per component. Describe: what it is, where it's used, background, text color, typography token, size/padding, border radius. Group related variants together (e.g., button-primary, button-primary-active, button-primary-disabled).

**Do's and Don'ts** — Specific, actionable rules grounded in the observed design. "Don't use cool grays for canvas" is good; "be consistent" is not.

**Responsive Behavior** — Breakpoints table, touch targets, collapsing strategy.

**Iteration Guide** — Numbered principles for working with the system over time (focus on one component at a time, use token refs, etc.)

**Known Gaps** — What couldn't be determined from screenshots alone (licensed fonts, animation timings, form validation states, product-specific components not visible).

### 4. Save the file

- Default: `DESIGN.md` in the project root
- If the user specifies a path (e.g., `docs/DESIGN.md`), use that instead
- If an existing DESIGN.md is present, check whether to overwrite or update

## Quality checklist before saving

- Every component property uses `{token.reference}` notation — no raw hex anywhere in components
- The `description` field in YAML reads as a coherent brand narrative
- Overview explains *why* the design creates the intended brand voice
- Color groupings in Markdown match the palette in YAML
- Typography principles explain the pairing rationale
- Known Gaps section is honest about what screenshots can't reveal

## Reference

See `references/format-spec.md` for the full DESIGN.md token type reference and valid component properties.

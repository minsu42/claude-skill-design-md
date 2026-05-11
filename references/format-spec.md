# DESIGN.md Format Specification

Source: https://github.com/google-labs-code/design.md

## YAML Frontmatter Schema

```yaml
version: <string>        # optional, currently "alpha"
name: <string>           # required
description: <string>    # optional (brand narrative)
colors:
  <token-name>: <Color>
typography:
  <token-name>: <Typography>
rounded:
  <scale-level>: <Dimension>
spacing:
  <scale-level>: <Dimension | number>
components:
  <component-name>:
    <property>: <string | token reference>
```

## Token Types

| Type | Format | Example |
|------|--------|---------|
| Color | Hex sRGB string | `"#1A1C1E"` |
| Dimension | Number + unit | `48px`, `-0.02em`, `8rem` |
| Token Reference | `{section.token-name}` | `{colors.primary}`, `{rounded.md}` |
| Typography | Object | See below |

## Typography Object Properties

```yaml
fontFamily: "FontName, fallback, serif"
fontSize: 16px
fontWeight: 400
lineHeight: 1.5
letterSpacing: 0px
fontFeature: "..."      # optional
fontVariation: "..."    # optional
```

## Component Properties (valid keys)

- `backgroundColor`
- `textColor`
- `typography`
- `rounded`
- `padding`
- `size`
- `height`
- `width`

All values should be token references (`{colors.primary}`) where applicable.
Literal values (e.g., `12px 20px` for padding) are allowed for properties without a dedicated token.

## Markdown Section Order

Sections use `##` headings and must appear in this sequence if present:

1. Overview (alias: Brand & Style)
2. Colors
3. Typography
4. Layout (alias: Layout & Spacing)
5. Elevation & Depth (alias: Elevation)
6. Shapes
7. Components
8. Do's and Don'ts

Additional sections (Responsive Behavior, Iteration Guide, Known Gaps) may follow after the canonical eight.

## Naming Conventions

- Color tokens: kebab-case, descriptive (e.g., `primary`, `surface-dark`, `on-primary`)
- Typography tokens: role-based (e.g., `display-xl`, `body-md`, `nav-link`)
- Spacing tokens: size-scale names (e.g., `xs`, `md`, `section`)
- Rounded tokens: size-scale names (e.g., `sm`, `lg`, `pill`)
- Component tokens: kebab-case with variant suffix (e.g., `button-primary`, `button-primary-active`)

## Linting Rules

- Unresolved token references (`{colors.nonexistent}`) trigger errors
- Duplicate `##` section headings trigger errors
- All color values must be valid hex strings

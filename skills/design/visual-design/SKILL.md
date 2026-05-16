---
name: visual-design
description: Visual design principles — color theory, typography, layout, iconography, brand identity, design tokens
triggers:
  - Creating visual design specifications
  - Establishing brand guidelines
  - Choosing color palettes
  - Typography decisions
  - Creating icon systems
---

# Visual Design

## Overview

Core visual design principles for creating consistent, beautiful, and accessible interfaces. Covers color, typography, layout, and brand expression.

## When to Use

```
Creating new UI design?
    ├─ Colors? → visual-design
    ├─ Typography? → visual-design
    ├─ Layout? → visual-design
    └─ Icons/brand? → visual-design

Establishing design system?
    └─ → visual-design

Brand refresh?
    └─ → visual-design
```

## Color System

### Color Palette Structure

```css
:root {
  /* Primary — brand color */
  --color-primary-50: #eff6ff;
  --color-primary-100: #dbeafe;
  --color-primary-200: #bfdbfe;
  --color-primary-300: #93c5fd;
  --color-primary-400: #60a5fa;
  --color-primary-500: #3b82f6; /* Main brand color */
  --color-primary-600: #2563eb;
  --color-primary-700: #1d4ed8;
  --color-primary-800: #1e40af;
  --color-primary-900: #1e3a8a;

  /* Neutral */
  --color-neutral-50: #f9fafb;
  --color-neutral-100: #f3f4f6;
  --color-neutral-200: #e5e7eb;
  --color-neutral-300: #d1d5db;
  --color-neutral-400: #9ca3af;
  --color-neutral-500: #6b7280;
  --color-neutral-600: #4b5563;
  --color-neutral-700: #374151;
  --color-neutral-800: #1f2937;
  --color-neutral-900: #111827;

  /* Semantic */
  --color-success: #10b981;
  --color-warning: #f59e0b;
  --color-error: #ef4444;
  --color-info: #3b82f6;

  /* Text */
  --text-primary: var(--color-neutral-900);
  --text-secondary: var(--color-neutral-500);
  --text-disabled: var(--color-neutral-300);
  --text-inverse: #ffffff;
}
```

### Color Contrast

```
WCAG AA (minimum for normal text): 4.5:1
WCAG AA (large text 18px+): 3:1
WCAG AAA (minimum): 7:1

Quick contrast check:
- Dark text on light bg: gray-700 or darker on white → OK
- Light text on dark bg: white or gray-100 on gray-800+ → OK
- Primary blue on white: #3b82f6 on white → ~4.6:1 ✓
```

### Dark Mode

```css
@media (prefers-color-scheme: dark) {
  :root {
    --bg-primary: var(--color-neutral-900);
    --bg-secondary: var(--color-neutral-800);
    --text-primary: var(--color-neutral-50);
    --text-secondary: var(--color-neutral-400);
    --border-color: var(--color-neutral-700);
  }
}
```

## Typography

### Type Scale

```css
/* Based on 1.25 ratio (Major Third) */
:root {
  --font-size-xs: 0.64rem;   /* 10.24px */
  --font-size-sm: 0.8rem;    /* 12.8px */
  --font-size-base: 1rem;    /* 16px — base */
  --font-size-lg: 1.25rem;   /* 20px */
  --font-size-xl: 1.563rem;  /* 25px */
  --font-size-2xl: 1.953rem; /* 31.25px */
  --font-size-3xl: 2.441rem; /* 39px */
  --font-size-4xl: 3.052rem; /* 48.8px */
}

/* With line-height */
--leading-tight: 1.25;   /* Headlines */
--leading-normal: 1.5;   /* Body */
--leading-relaxed: 1.75; /* Long-form content */

/* With letter-spacing */
--tracking-tight: -0.025em;  /* Large headlines */
--tracking-normal: 0;         /* Body */
--tracking-wide: 0.025em;    /* All-caps labels */
```

### Type specimens

```markdown
## Heading 1
**Size:** 2.441rem (39px)
**Weight:** 700 (Bold)
**Use:** Page titles, hero text

## Heading 2
**Size:** 1.953rem (31px)
**Weight:** 600 (Semibold)
**Use:** Section titles

## Heading 3
**Size:** 1.25rem (20px)
**Weight:** 600 (Semibold)
**Use:** Card titles, subsections

## Body
**Size:** 1rem (16px)
**Weight:** 400 (Regular)
**Leading:** 1.5
**Use:** Paragraphs, descriptions

## Caption
**Size:** 0.875rem (14px)
**Weight:** 400 (Regular)
**Color:** text-secondary
**Use:** Helper text, metadata
```

### Font Pairing

```css
/* Sans-serif (modern, clean) */
--font-heading: 'Inter', system-ui, -apple-system, sans-serif;
--font-body: 'Inter', system-ui, -apple-system, sans-serif;

/* Serif + Sans (editorial) */
--font-heading: 'Playfair Display', Georgia, serif;
--font-body: 'Source Sans Pro', system-ui, sans-serif;

/* Mono (technical) */
--font-mono: 'JetBrains Mono', 'Fira Code', monospace;
```

## Layout

### Spacing System

```css
:root {
  /* Base unit: 4px */
  --space-0: 0;
  --space-1: 0.25rem;  /* 4px */
  --space-2: 0.5rem;   /* 8px */
  --space-3: 0.75rem;  /* 12px */
  --space-4: 1rem;     /* 16px */
  --space-5: 1.25rem;  /* 20px */
  --space-6: 1.5rem;   /* 24px */
  --space-8: 2rem;     /* 32px */
  --space-10: 2.5rem;  /* 40px */
  --space-12: 3rem;    /* 48px */
  --space-16: 4rem;    /* 64px */
  --space-20: 5rem;    /* 80px */
  --space-24: 6rem;    /* 96px */
}
```

### Layout Grid

```css
/* 12-column grid */
.grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: var(--space-6);
}

/* Container */
.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 var(--space-6);
}

/* Breakpoints */
@media (max-width: 640px)  { /* Mobile */ }
@media (max-width: 768px)  { /* Tablet */ }
@media (max-width: 1024px) { /* Laptop */ }
@media (max-width: 1280px) { /* Desktop */ }
```

### Responsive Breakpoints

| Name | Min-width | Use |
|------|-----------|-----|
| xs | 0 | Extra small (mobile) |
| sm | 640px | Small (large phone) |
| md | 768px | Medium (tablet) |
| lg | 1024px | Large (laptop) |
| xl | 1280px | Extra large (desktop) |
| 2xl | 1536px | 2XL (large desktop) |

## Iconography

### Icon System

```css
/* Icon sizing */
.icon-sm { width: 16px; height: 16px; }
.icon-md { width: 20px; height: 20px; }
.icon-lg { width: 24px; height: 24px; }
.icon-xl { width: 32px; height: 32px; }

/* Icon color inherits text color */
.icon {
  width: 1em;
  height: 1em;
  fill: none;
  stroke: currentColor;
  stroke-width: 1.5;
  stroke-linecap: round;
  stroke-linejoin: round;
}
```

### SVG Icon Template

```svg
<svg xmlns="http://www.w3.org/2000/svg"
     viewBox="0 0 24 24"
     fill="none"
     stroke="currentColor"
     stroke-width="1.5"
     stroke-linecap="round"
     stroke-linejoin="round"
     role="img"
     aria-label="Description of the icon">
  <path d="M..."/>
  <circle cx="..." cy="..." r="..."/>
</svg>

<!-- Style rules:
     - viewBox: always "0 0 24 24"
     - stroke: currentColor (adapts to context)
     - stroke-width: 1.5 for outlined icons
     - stroke-linecap/join: round for friendly feel
-->
```

## Brand Expression

### Logo Usage

```markdown
## Logo Clear Space
Minimum clearance = height of the "A" in the logo
Never place other elements within this space.

## Logo Sizes
- Minimum width: 80px (digital), 25mm (print)
- Maximum width: 200px (digital) — scale proportionally

## What NOT to do
- ✗ Don't stretch or distort
- ✗ Don't change colors outside brand palette
- ✗ Don't add effects (shadows, gradients)
- ✗ Don't place on busy backgrounds without clearance
- ✗ Don't use low-resolution versions
```

### Brand Voice

```markdown
## Tone: Professional but Human

### We sound like:
- Confident but not arrogant
- Direct but not cold
- Helpful without being sycophantic
- Technically accurate but not jargon-heavy

### We don't sound like:
- Corporate and stiff
- Casual and flippant
- Condescending
- Overly technical without explanation

### Voice examples:
Good: "Your trial has expired. Upgrade to keep access."
Bad:  "Your trial period has concluded. Please navigate to our pricing page."
```

## Pitfalls

- **Choosing colors without contrast checking.** Always verify WCAG contrast ratios.
- **Inconsistent spacing.** Use the spacing system, not arbitrary values.
- **Too many fonts.** 2 fonts max (one for headings, one for body).
- **Ignoring dark mode.** Design for both from the start.
- **Non-semantic colors.** "Use red for errors" isn't enough — specify the exact color token.

# letters

PDF document generator. Write HTML fragments, get professionally styled PDFs with a consistent letterhead.

This repo ships with a fictional company ("Example Co.") and one example invoice in `documents/`. Swap in your own letterhead in `templates/base.html`, logo in `assets/logo.svg`, and brand color in `styles/letter.css`.

## Requirements

- Google Chrome (used headless for PDF rendering)
- GNU Make

## Usage

```bash
make          # build all PDFs from documents/*.html -> output/*.pdf
make clean    # remove build/ and output/
```

## How it works

1. Write an HTML fragment in `documents/` (just the body content -- no `<html>`, `<head>`, or boilerplate)
2. Run `make`
3. The Makefile splices each fragment into `templates/base.html` (which provides the letterhead, logo, and footer), then Chrome headless renders it to PDF

## Project structure

```
documents/        HTML content fragments (one per document)
templates/
  base.html       Shared wrapper: top bar, letterhead, footer
styles/
  letter.css      Print stylesheet (page size, typography, layout)
assets/
  logo.svg        Company logo
build/            Intermediate assembled HTML (gitignored)
output/           Generated PDFs (gitignored)
```

## Writing a new document

Create an HTML file in `documents/`. The template provides:

- Edge-to-edge colored top bar
- Company info and logo
- "Page 1 of 1" footer pinned to the bottom

Your fragment only needs the unique content. Example:

```html
<h1>Document Title</h1>

<div class="meta">
  <div><strong>Date</strong> March 17, 2026</div>
  <div><strong>Reference</strong> REF-001</div>
</div>

<h3>Section Heading</h3>

<dl class="details">
  <dt>Label</dt>
  <dd>Value</dd>
</dl>
```

### Available CSS classes

| Class | Purpose |
|-------|---------|
| `.meta` | Key-value metadata block (date, reference, etc.) |
| `.addresses` | Two-column from/to address layout |
| `.details` | Definition list styled as key-value pairs |
| `.amount-banner` | Large amount display with optional link |
| `.totals` | Right-aligned summary table |
| `.line-items` | Full-width table with header borders |

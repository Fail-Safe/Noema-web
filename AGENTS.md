# Repository Guidelines

## Project Purpose

Noema-web is the Astro-powered public website for Noema. It should reflect
Noema's anti-slick positioning and the brand rules maintained in
`../Noema-design`.

## Project Structure

- `src/pages/index.astro` is the main page.
- `src/layouts/Layout.astro` owns the HTML, metadata, and layout shell.
- `src/styles/global.css` contains the global theme and responsive styles.
- `public/` contains static assets such as `brand/`, `favicon.svg`,
  `robots.txt`, `llms.txt`, and `CNAME`.
- `dist/` is generated build output. Do not hand-edit it.

## Build, Test, and Development Commands

- `npm run dev`: starts the local Astro development server.
- `npm run build`: builds the production site. Run this before finishing website
  changes.
- `npm run preview`: previews the built site locally.

## Style and Brand

- Follow `../Noema-design/graphics/BRAND.md` and
  `../Noema-design/docs/positioning.md`.
- Prefer the dark primary brand surface and exact brand colors: `#1a1a1a`,
  `#ece4d4`, and `#e10032`.
- Avoid gradients, glows, orbs, generic AI visuals, and hype-heavy SaaS copy.
- Use the existing font stack and dependencies: EB Garamond, Inter, and
  JetBrains Mono.
- Do not hand-edit generated brand assets from the design repo. Update the
  source or generator there, then copy intentional artifacts into `public/`.

## Implementation Guidelines

- Keep the site static unless there is a clear need for client-side behavior.
- Prefer existing Astro, component, and CSS patterns over adding new frameworks.
- Keep `public/llms.txt`, metadata, sitemap, and robots behavior aligned with
  public-facing copy when changing positioning.
- Do not modify `dist/` directly; rebuild it.

## Agent Guidelines

- Keep public-facing copy free of private hostnames, internal agent or cortex
  names, and personal identifiers unless explicitly approved.
- Run `npm run build` before handing off web code or content changes.

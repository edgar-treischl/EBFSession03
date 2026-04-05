# Copilot Instructions

This repository contains lecture slides for **Empirische Bildungsforschung (EBF)** at FAU Nürnberg-Erlangen, built with [Reveal.js](https://revealjs.com) and [Vite](https://vitejs.dev). Slides are deployed to GitHub Pages at https://edgar-treischl.github.io/EBFSession03/.

## Build & Dev Commands

```bash
make dev       # start dev server at http://localhost:3000
make build     # production build → dist/
make preview   # serve the build locally
```

Or directly with yarn: `yarn dev` / `yarn build` / `yarn preview`.

There are no tests or linters configured.

## Architecture

All slide content lives in a **single `index.html`** file as nested `<section>` elements inside `.reveal > .slides`. There is no component system — all edits to slides are made directly in `index.html`.

- **`main.js`** — Imports and initializes Reveal.js (ESM build), the base theme (`white`), and `custom.css`.
- **`custom.css`** — Custom fonts (Source Sans Pro, loaded from `/assets/`) and utility layout classes.
- **`vite.config.js`** — Sets `base: '/EBFSession03/'`, which is required for GitHub Pages to resolve assets correctly. Do not remove this.
- **`public/audio/`**, **`public/media/`**, **`public/video/`** — Static assets referenced by slides.
- **`r/`** — R scripts and reference data (not part of the build).
- **`others/`** — Supporting documents (not part of the build).
- **`.github/workflows/deploy.yml`** — Auto-deploys to GitHub Pages on every push to `main` via `yarn build`.

## Slide Conventions

**Horizontal vs. vertical slides:** A top-level `<section>` is a horizontal slide. Nest `<section>` elements inside a `<section>` to create a vertical stack (navigated with the down arrow).

**Asset paths in slides** use relative paths without a leading `/`:
```html
<img src="media/filename.png">
<audio><source src="audio/filename.mp3" type="audio/mpeg"></audio>
<video><source src="video/filename.mp4" type="video/mp4"></video>
```

**Brand color class** — Use `.text-color` (or `<font color="#8D1429">`) for the FAU red accent. Use `.correct-answer` (green) for quiz answers revealed via Reveal.js fragments.

**Slide backgrounds:**
```html
<section data-background-image="media/filename.png">   <!-- static image -->
<section data-background="media/filename.gif">          <!-- gif -->
<section data-background-iframe="https://..." data-background-interactive>  <!-- embedded URL -->
```

**Quiz/fragment pattern** — Multiple-choice questions use `.fragment.fade-up` inside a `<blockquote>` to reveal the correct answer:
```html
<p class="fragment fade-up">
  <font color="#006d2c"><i class="fa fa-bulb"></i> Richtige Antwort: C</font>
</p>
```

**Font Awesome 4.7.0** is loaded via CDN in `index.html` — use `<i class="fa fa-*">` icons.

**Language:** Slide content is in German (`<html lang="de">`).

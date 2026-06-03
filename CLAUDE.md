# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Craft CMS 5 boilerplate** for William Joseph Ltd projects. Development runs entirely inside a **DDEV Docker container** — always prefix commands with `ddev` unless running inside the container.

## Commands

### Environment
```bash
ddev start                          # Start DDEV environment
ddev stop                           # Stop environment
ddev ssh                            # Shell into container
```

### Dependencies
```bash
ddev composer install               # Install PHP dependencies
ddev npm ci                         # Install Node dependencies (use ci, not install)
```

### Asset Pipeline
```bash
ddev npm run dev                    # Vite dev server + BrowserSync (watches templates too)
ddev npm run build                  # Production build → web/dist/
```

### Craft CLI
```bash
ddev php craft setup                # Initial setup (DB, admin user, security key)
ddev php craft project-config/apply # Apply project config changes after pulling
ddev php craft clear-caches/all     # Clear all caches
ddev import-db                      # Import database snapshot
```

## Architecture

### Asset Pipeline
- **Entry point:** `src/index.js` → **Output:** `web/dist/`
- Vite handles SCSS compilation, JS bundling, image optimization, and legacy browser support
- Assets are cache-busted via manifest; Craft reads `web/dist/.vite/manifest.json` through the `nystudio107/craft-vite` plugin
- Static assets (fonts, images) are copied verbatim; SVGs are excluded from image processing

### Template System
- **Base layout:** `templates/_layouts/base.twig` — HTML shell, GTM, cookie consent
- **Entry routing:** `templates/_entry.twig` — dispatches to section/type-specific templates by checking `entry.section` and `entry.type`
- **Components:** `templates/_components/` — reusable partials (header, footer, hero, breadcrumb, pagination, site-search)
- **Matrix blocks:** `templates/_partials/entry/` — block templates named `block__<handle>.twig`; each renders its nested entries via `.eagerly().render()`, which automatically maps to the corresponding `comp__<handle>.twig` partial in the same directory
- **Macros:** `templates/_macro.twig` — utilities for responsive images (`srcset`), video embeds, click-to-call, and copy-link. Import with `{% import '_macro' as macro %}`

### JavaScript
All JS is vanilla ES modules (jQuery was removed). Modules live in `src/scripts/` and are imported from `src/index.js`. Current modules: accordion, cookies, video, data-link, copy-link, go-back, site-header-nav.

### CSS
Tailwind CSS v4 (utility-first) + PostCSS + SCSS. Configuration (breakpoints, colours, spacing, fonts) is done in CSS via `@theme` inside `src/styles/site.css` — there is no `tailwind.config.js`. Custom breakpoints: `sm` (420px), `md` (640px), `nav` (900px), `lg` (1024px), `xl` (1280px). SCSS source is organized under `src/styles/` with subdirectories: `base/`, `components/`, `matrix/`, `utility/`. Use arbitrary value syntax for unknown utilities, e.g. `[clip-path:none]` instead of `@apply`.

### Craft Configuration (`config/`)
- `general.php` — core Craft settings (dev mode, admin URL, image quality 75%, max upload 160MB)
- `vite.php` — Vite plugin config, dev server at `localhost:3000`
- `assetrev.php` — asset versioning manifest path
- `knock-knock.php` — staging password protection

### Key Plugins
| Plugin | Purpose |
|--------|---------|
| `nystudio107/craft-vite` | Vite asset integration |
| `nystudio107/craft-seomatic` | SEO, sitemaps, structured data |
| `nystudio107/craft-cookies` | Cookie consent management |
| `craftcms/ckeditor` | Rich text (CKEditor 5) |
| `verbb/formie` | Form builder |
| `nystudio107/craft-retour` | Redirect management |
| `verbb/image-resizer` | Image transforms |
| `clubstudioltd/craft-asset-rev` | Asset cache busting |
| `nystudio107/craft-typogrify` | Typography enhancements |
| `miranj/craft-obfuscator` | Email obfuscation |
| `verbb/knock-knock` | Staging password protection |
| `putyourlightson/craft-datastar` | Live search (server-sent events via Datastar) |

### Environment Variables
Copy `.env.example.dev` to `.env`. Key variables: `CRAFT_ENVIRONMENT`, `CRAFT_DEV_MODE`, `CRAFT_ALLOW_ADMIN_CHANGES`, `CRAFT_DB_*`, `CRAFT_WEB_URL`, `CRAFT_ADMIN_URL` (default: `boiler-admin`), `SITE_NAME`, `PRIMARY_SITE_URL`, and Mailpit SMTP settings for local email testing.

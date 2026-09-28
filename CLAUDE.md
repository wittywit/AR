# AR-VR: project rules

A nine-hour phone-only AR teaching kit for NIFT Fashion Communication students.
Read `README.md` for the file map, `COURSE-PLAN.md` for the schedule.

## Hard constraints, do not relax these

- **Phones only.** Students have no headsets and no lab machines. Every drill needs a path that works on a
  mid-range Android or iPhone. VR appears only as literacy (`sim-360.html`), never as a build target.
- **No code, no accounts, no paid software.** Path A (the `/docs` tools) must stay account-free and
  installation-free. Path B in `TOOLKIT.md` is the commercial fallback.
- **Offline-first and local.** Nothing in `/docs` may upload a file, a photo, a model or a camera frame.
  Image analysis, GLB parsing and camera work all run on the device; answers persist in `localStorage`.
- **Costs in INR (₹)**, Indian sellers. Hardware is deliberately excluded and stays excluded.

## Design

- The whole of `/docs` is a design exception (requested 2026-09-28): Saul Bass / mid-century
  title-sequence language: flat shapes, 900-weight uppercase Archivo, vermilion `#e63420` plus one
  mustard `#f0a500` on black and white, hard rules, no gradients. **No beige.**
- The tokens live twice: in `docs/deck.html`'s own `<style>`, and in `:root` in `docs/style.css`, which
  every tool page loads. Keep the two in sync: `--ink #111`, `--ink-soft #444`, `--ink-mute #8a8a8a`,
  `--paper #fff`, `--paper-2 #f2f2f2`, `--line #d8d8d8`, `--accent #e63420`, `--accent-2 #f0a500`,
  `--accent-w #fdecea`, `--sans` (Archivo), `--mono`.
- Page-local `<style>` blocks and canvas drawing code use those variables / hex values, never fresh
  colours. Vermilion in a canvas means an alert or a failure state, nothing else.
- `deck.html` links out to every tool page with `class="toollink"` or `class="pill link"`, always
  `target="_blank"` (a tool must never replace the presenter's slide) and `z-index:30` so the link
  clears the phone tap zones.
- **Never use emoji as icons.** Inline stroke SVG with `currentColor`, or real images.
- The deck is audience-facing. No facilitator notes, no clock timings, no logistics metadata, no internal
  block numbering ("Theory Three") in it. That material lives in `COURSE-PLAN.md` and `THEORY-NOTES.md`.

## Publishing

- The kit is pushed to `https://github.com/wittywit/AR` on `main`. GitHub Pages serves `/docs`.
- Push with `./push.sh "message"`. It stages, commits under the repository git identity and pushes.
  It adds no co-author trailer. Use it rather than a raw `git push`.

## Conventions in `/docs`

- One self-contained HTML file per tool. No build step, no framework, no bundler.
- ES5-flavoured plain JS in a single `<script>` at the bottom, wrapped in an IIFE with `"use strict"`.
- Reuse the classes already in `style.css`: `.wrap` / `.wrap.wide`, `.panel`, `.row`, `.readout`, `.mono`,
  `.tag`, `.bar > span`, `.note`, `.backlink`, `.noprint`, `nav.level-picker` + `section.level.active`.
- Camera and AR libraries are **lazy-loaded on a button press**, never on page load, and every page warns on
  `!window.isSecureContext` and fails with a message pointing at README §Plan B.
- AR libraries per page: `ar-print.html` = MindAR image tracking; `ar-face.html` = the **8th Wall
  open-source engine** (`@8thwall/engine@0.1.0` with `data-preload-chunks="face"`, plus
  `@8thwall/xrextras@1.0.0`) on **stock A-Frame 1.5.0**, not 8th Wall's "8frame" fork, which is only
  published through Git LFS and no CDN serves it; `ar-place.html` = `<model-viewer>`. MindAR is not used
  on Day 2. The open-source engine has no SLAM, so Day 3 does not move to it.
- `localStorage` keys are namespaced `xr.<tool>` (the deck uses `xr-deck-slide`).
- Verify every edited page: HTML tag balance (`html.parser`), `node --check` on the extracted script, and a
  grep for emoji. Camera pages cannot be verified headlessly. They need a device.

## Teaching spine

Three artifacts across three days: **The Living Lookbook** (image target), **The Brand Filter** (face),
**The Placed Product** (plane, true scale). Six words students must use correctly to get a distinction:
*trigger, anchor, tracking, occlusion, drift, payload.* The numbers: ≤100k triangles, ≤2048 px textures,
≤10 MB, ≤8 s to first content, 1 unit = 1 m.

## Writing rules (revised 2026-09-28)

Every document in this repository follows one voice. Academic prose, close to ASD-STE100 Simplified
Technical English, plus the Studio Poetics rules below. This applies to `docs/deck.html`, every `/docs`
page, the worksheets, and every markdown file.

Register. No promotional language. No outcome promises, no superlatives, no career claims. State what is
true, name the mechanism, give the limit. Behavioural claims such as abandonment at eight seconds are
stated as observed tendencies.

Sentences. Short and exact. One idea per sentence. Remove qualification and ornament. Prefer the active
voice and a direct object that can be observed, touched, delayed, held, or changed.

Vocabulary. Restricted and repeated. Reuse *trigger, anchor, tracking, occlusion, drift, payload* rather
than reaching for synonyms. Plain terms, not trade jargon: *produce* and *publish*, not *ship*.

Punctuation. **No em dashes anywhere.** Use a full stop, a comma, a colon, or two sentences. This includes
`&mdash;` in HTML and `—` in markdown.

Structure. Enter mid-condition: begin where the phenomenon is already happening, not with an introduction.
Describe behaviour before meaning. Stay with one phenomenon per passage. Build by accumulation, so each
paragraph adds a condition, an observation, or a consequence. Repeat a point only when the repetition
sharpens it.

Prohibited moves. No rhetorical questions; state the question as a proposition. No explanatory framing
("this means", "in other words", "what this shows is"). No instructions to the reader about what to feel.
No abstractions asserted as qualities ("interesting", "meaningful", "beautiful"); describe how the
abstraction behaves in the situation.

Metaphor. At most one per paragraph, roughly three in any one document, all from one system. A metaphor
describes structure or behaviour. Return to the thing itself immediately after.

Endings. Hold the state. The last sentence leaves the phenomenon present rather than concluded. Table
headers and labels stay descriptive: "Fails when", "The principle it demonstrates".

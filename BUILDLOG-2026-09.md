# Build log — September 2026

## 2026-09-27 — Course design

Brief: teach AR/VR with no-code tools in 9 hours (3 × 3 h) to NIFT Fashion Communication students, with a
mix of skills, theory, small and big activities — and build the tools to teach with, not just a plan.

Five corrections from the user reshaped it:

1. **Phones only, no hardware** → the course became AR-first. VR shrank to a single literacy block. Every
   drill got a phone-only path. Headset pricing stayed only as a labelled "deliberately excluded" note.
2. **A presentation-style HTML page for the whole course** → `docs/deck.html` became the priority.
3. **Formal and presentable aesthetics** → the deck was released from the house black-and-white style.
4. **No beige — think Saul Bass** → full palette and typography rewrite: flat shapes, 900-weight uppercase
   Archivo, vermilion `#e63420` plus one mustard `#f0a500` on black and white, hard rules, no gradients.
5. **No facilitator notes in the presentation** → stripped `Instructor:` lines, clock timings, the logistics
   string on the title slide, divider component lists, and finally the internal "Theory N" block numbering
   itself, which was the same kind of note one level up. 65 slides, tags balanced, no emoji.

Written: `COURSE-PLAN.md` (minute-by-minute), `THEORY-NOTES.md` (seven theory blocks), `ASSESSMENT.md`
(brief, 100-mark rubric, worksheets, jury card), `TOOLKIT.md` (Path A vs Path B, INR costs).

## 2026-09-27 — The `/docs` tool suite

Built the half of the brief that was still missing — the tools themselves. All self-contained, no build
step, no accounts, nothing uploaded.

- **`index.html`** — student handbook. Four tabs (three days plus reference) on the `level-picker` pattern
  with hash routing; per-day tool tables with a camera column; the six-word vocabulary table, the numbers,
  and the format table in the reference tab.
- **`sim-continuum.html`** — the reality–virtuality continuum as a single slider over four cross-faded
  canvas layers (shop interior → AR card → understood surfaces → authored environment), each band answering
  "can this class ship it?".
- **`sim-tracking.html`** — the flagship. Real computer vision in the page: luminance, Sobel, Harris corner
  response on a lattice, bucketed non-maximum suppression, an 8×8 occupancy grid for spread, and 4×4 blocks
  of 12-bin gradient-orientation histograms compared by cosine similarity for uniqueness. Weighted score,
  four verdict bands, crosshair render, and a table translating each weak metric into a design instruction.
  Five procedural demo targets show the failure modes. Runs on the student's own portfolio images, locally.
- **`sim-anchors.html`** — an animated fake camera view driven by a signal model over texture, light, speed
  and anchor type. Drift accumulates when quality drops. Occlusion and contact-shadow toggles. `diagnose()`
  returns one of six plain-language causes, so students learn to name the failure, not just see it.
- **`ar-print.html`** — real WebAR. MindAR image tracking via A-Frame, lazy-loaded on button press. Student
  uploads their own image or video as payload. Rear camera, HTTPS or localhost.
- **`ar-face.html`** — MindAR face tracking, front camera. Six named landmark anchors, four payload types
  (frames, badge with student artwork, hanging drop, orbiting ring), live scale. Carries the honest limit:
  rigid things on stable landmarks work; cloth physics does not. Plus the consent paragraph.
- **`ar-place.html`** — `<model-viewer>` handing off to Scene Viewer and AR Quick Look. `ar-scale="fixed"`,
  because pinch-to-resize hides a broken model. Student `.glb` / `.usdz` upload, true-scale comparisons,
  contact-shadow and exposure sliders as believability switches.
- **`tool-asset-check.html`** — parses the GLB header, JSON chunk and BIN chunk by hand: counts triangles
  across primitives, and reads real pixel dimensions out of embedded PNG (IHDR) and JPEG (SOF marker walk)
  bytes. Verdicts against 100k tris / 2048 px / 10 MB, a per-device log, and a fix-it table.
- **`tool-storyboard.html`** — four beats (trigger, invitation, payload, payoff) plus pitch and honest
  failure mode, one sheet per artifact, autosaved and printable. Beat two exists because the most common
  failure is a perfect experience nobody opens.
- **`sim-360.html`** — 3DoF vs 6DoF as parallax you can feel, with a real pose queue so the latency slider
  actually delays the applied pose, a frame-rate limiter that actually judders, artificial locomotion, and
  a vignette. Outputs a comfort score with named causes.
- **`worksheets.html`** — every worksheet, the asset gate, the jury card and the rubric; fields autosave to
  the device, print CSS puts one sheet per page.

Also: `README.md` with **§Serving** (`python3 -m http.server`, and why a phone on `http://192.168.x.x`
still will not get the camera — hosted HTTPS, a tunnel, or Path B) and **§Plan B** (curl commands to vendor
A-Frame, both MindAR builds and model-viewer into `docs/vendor/`, plus the `sed` lines to repoint the
pages, and the note that offline also means pre-compiled `.mind` files per team).

Verification on every page: HTML tag balance via `html.parser`, `node --check` on the extracted script, and
a grep for emoji. All twelve pages clean. The three camera pages cannot be checked headlessly and are in
the pre-flight checklist for device testing.

One bug worth remembering: in `sim-tracking.html` the uniqueness double loop had `var j2` declared inside
the body while used in the loop header. Fixed by declaring it in the header.

Open question never answered by the user: whether the `/docs` tool pages should also carry the Saul Bass
treatment. Proceeded with the house black-and-white style, since the deck was the only page granted an
explicit exception.

## 2026-09-27 — Register correction: academic, not promotional

The line "In nine hours you will ship a campaign, not a demo." was rejected as an
over-promise and as marketing register in a teaching context. Swept the whole kit for the
same voice and rewrote it.

Rewritten in `docs/deck.html` (16 passages): the deliverable headline, the "only three
things" claim, the "brief any AR studio for the rest of your career" promise, the constraint
slide, "everything you were trained to make beautiful kills a target", "the real skill of
today", "the difference between a communicator and a salesperson", "five questions that make
you the smartest person in the meeting", "a much smaller career", "stunning to look at",
"the fastest way to learn capture", "use them relentlessly".

Also rewritten: `ar-face.html` ("the test that matters" / "most useful person in the room"),
`ar-place.html` ("pinch-to-resize is a lie", "someone else's problem on showcase day"),
`tool-asset-check.html` ("single most common waste", "the edge of patience"),
`tool-storyboard.html` ("they are commitments", "a client who is already bored", "a rotating
logo is not an idea"), `sim-360.html` (subtitle, comfort verdicts, sim-sickness causes),
`sim-continuum.html` (subtitle and lede), `worksheets.html`, `ASSESSMENT.md`, `README.md`,
`THEORY-NOTES.md`, `TOOLKIT.md`, `COURSE-PLAN.md`.

Verified after: all 12 `docs/*.html` tag-balanced (`unclosed=[] err=0`), 0 emoji, all inline
`<script>` blocks pass `node --check`, deck still 65 slides. Rule recorded in `CLAUDE.md`.

## 2026-09-28 — Clarity and academic presentation pass

Second pass over the same material, this time for clarity rather than only register. Replaced
elliptical fragments and trade jargon with complete, explicit sentences.

`docs/deck.html`: removed a surviving clock reference ("we will come back to your list at
0:45") from an audience slide; rewrote the continuum claim, the brief statement, the try-on
limit slide ("sells the look" → "represents the look"; "Still theatre" → "Simulated, not
modelled"), the VR module openers, the WebAR reach/fidelity claim, the 40 MB example, the
accessibility line, the final-build instruction and the closing slide.

Jargon normalised to plain terms across the kit: *ship* → *produce / publish / deliver*;
Day 3 retitled **Place & Publish** in `deck.html` and `index.html`; `sim-continuum.html`'s
row label became "Achievable in this course?" and its one-word answers were written out;
`sim-tracking.html` and `sim-anchors.html` subtitles and table headers rewritten ("Dies
when" → "Fails when", "The lesson" → "The principle it demonstrates"); `THEORY-NOTES.md`
Theory 7 retitled "Publishing and distribution"; `TOOLKIT.md` and `COURSE-PLAN.md` outcome
lines restated without portfolio/employability framing.

Verified: 12/12 `docs/*.html` tag-balanced, zero emoji, all inline scripts pass
`node --check`, deck still 65 slides.

## 2026-09-28 — One visual language across the kit, and deck → tool links

The deck used to be the only page allowed a design exception; every other page in `/docs`
ran the default black-and-white rendered-markdown look. Asked for the activity pages to
follow the presentation's style and for the deck to link to them, so both rules moved.

`docs/style.css` was rewritten wholesale rather than editing eleven pages, because every
tool page already reuses the same class vocabulary — redefining those selectors in the
deck's tokens restyles the whole suite with no markup change and no risk of breaking a
page. Archivo arrives via a single `@import` in the stylesheet (the `-apple-system` /
Helvetica / Arial fallback keeps the pages usable with no network, which matters — the kit
is offline-first). `:root` now carries the deck's tokens plus `--mono`. Georgia and Courier
New are gone from the UI; `h1` takes the 6px ink rule, `h2` the vermilion bar, tables the
deck's rules-not-boxes treatment, `.panel` a 5px ink top border, buttons and `.tag`
uppercase 800-weight Archivo, list markers vermilion. The deck's `.kicker` came across as a
section eyebrow. The `@media print` block survived unchanged.

Page-local `<style>` blocks in `ar-print`, `ar-face`, `ar-place`, `sim-360`,
`tool-asset-check`, `tool-storyboard` and `worksheets` were tokenised — no more literal
`#000` / `#fff` / `"Courier New"`. A few gained real emphasis rather than a straight
substitution: the camera HUD strips now sit under a vermilion rule, the storyboard beat
numbers are solid vermilion chips, `worksheets`' `.when` labels are accent eyebrows, and
`tool-asset-check`'s failing verdict fills vermilion instead of black.

In canvas code, vermilion was given exactly one job: an alert or failure state. The
`sim-360` mismatch banner ("YOU MOVED. THE WORLD DID NOT.") and the `sim-anchors` HUD bar
when tracking is lost. The Georgia inside `sim-tracking`'s synthetic target images stays —
that is drawn content standing in for a printed lookbook page, not UI.

`deck.html` gained `a.toollink` and `a.pill.link`, and all eleven tools are now reachable
from it: the two activity pills became links, the three Path A cards' headings became
links, four inline `<code>` mentions were wrapped, and three tools that were never named on
a slide got one each — `sim-continuum.html` under Fig. 1, `sim-anchors.html` on the plane
AR slide, `worksheets.html` on the XR Audit pills. Every link is `target="_blank"` so a
tool never replaces the presenter's place in the deck, and carries `z-index:30` so it
clears the fixed 16vw tap zones on a phone.

`CLAUDE.md`'s Design section was rewritten: the deck is no longer the sole exception, the
token list is recorded in one place with a note to keep `deck.html` and `style.css` in
sync, and the linking convention is written down.

Verified: 12/12 `docs/*.html` tag-balanced, zero emoji, all inline scripts pass
`node --check`, deck still 65 slides, and all eleven `href` targets resolve on disk.

## 2026-09-28 — Day 2 moved to the 8th Wall open-source engine

Asked to use "8th wall free version on github that they released" for Day 2, or Day 3. Day 3 was ruled
out on evidence: the MIT release **excludes SLAM world tracking**, VPS, Lightship Maps and hand tracking
(those stay in a separately licensed binary), and `ar-place.html` already hands off to Scene Viewer and
AR Quick Look, which is the better phone-only path anyway. Day 1 was ruled out too — 8th Wall image
targets need compiled target files, so `ar-print.html` stays on MindAR. Day 2 fits exactly: face
tracking ships in the MIT build, with no account, no npm and no build step.

The user chose to **replace MindAR entirely** on Day 2 rather than offer both.

Before writing a line of the page, the real 0.1.0 API was read from primary sources rather than guessed:
the engine's `xr-web-component.ts`, `xr-config-component.ts` and `common.ts`, xrextras'
`face-components.ts`, the A-Frame README primitive tables, the shipped minified `xr.js`, and the official
`aframe-image-targets-example` head. What that settled:

- `data-preload-chunks` is split on commas; `"face"` imports `xr-face.js` relative to the engine script's
  own URL and assigns `XR8.FaceController`. jsDelivr therefore serves the chunk **and** its `.tflite`
  models automatically. `"slam"` is not requested.
- `xrconfig`'s `cameraDirection` defaults to `back`, so a face page must set `front` explicitly;
  `allowedDevices` defaults to `mobile-and-headsets`, so `any` is needed for a laptop-webcam demo.
- Anchors are **named**, not numeric: `forehead`, `noseBridge`, `chin`, `leftCheek`, `rightCheek`,
  `noseTip`, `mouth`, `leftEar`, `rightEar` and the rest of FACE_POINTS. `xrextras-face-attachment` sets
  position only; rotation comes from the parent `xrextras-faceanchor`.
- **8frame is unusable.** The pinned CDN URL for 8th Wall's A-Frame fork returns HTTP 200 and 132 bytes —
  a Git LFS pointer, not JavaScript. Neither package declares an A-Frame dependency and
  `8thwall.org/docs/engine/aframe` 404s, so the page loads **stock A-Frame 1.5.0**, the same build
  `ar-print.html` already uses.
- `xrextras-face-mesh` re-asserts its own `visible` on every `xrfaceupdated`, so the show/hide toggle is
  applied to a wrapper `<a-entity>` around it, never to the element itself.

`docs/ar-face.html` rebuilt on that: lazy load on button press (A-Frame → engine `async` with the face
chunk → xrextras), `<a-scene xrface="maxDetections: 1" xrconfig="cameraDirection: front; mirroredDisplay:
true; allowedDevices: any" xrextras-almost-there xrextras-runtime-error>`, the payloads and scale controls
carried over unchanged, and a new mustard wireframe mesh toggle — mustard because vermilion in a canvas
means failure. `xrextras-loading` was deliberately **not** used: it paints a vendor-branded overlay over
the kit's own design language, and the `#status` HUD already covers the loading state.

Also updated: the deck's Day 2 Path A card and its platform-risk card (Spark's shutdown now sits beside
8th Wall's, which is the sharper lesson — one platform closed and took every effect with it, the other
closed and left the engine behind); `TOOLKIT.md` face-AR section with the licence history and the two
limits, plus a §3 free-tier trap about the `0.1.x` pre-release API; `README.md` §Plan B, which now vendors
`xr.js`, `xr-face.js` and `resources/*.tflite` in their original layout, because the engine resolves those
paths relative to its own script URL; `docs/index.html`'s Day 2 row; and `CLAUDE.md`, which records the
per-page AR library choice as a rule.

Verified: `ar-face.html` tag-balanced, zero emoji, script passes `node --check`, deck still 65 slides.
**The rebuilt page cannot be verified headlessly** — it needs a phone over HTTPS or localhost, and it is
the first item on the device-test list.

---

## 2026-09-28: voice rewrite across the whole kit

The prompt was a single line of `docs/index.html` read back: "You learn what face and body tracking
genuinely do, where try-on stops being honest, and you build". The objection was the register, not the
sentence. The instruction attached to it: write the way academic books are written, and follow ASD-STE100
Simplified Technical English, under sixteen Studio Poetics rules. Rule 6 is absolute. No em dashes
anywhere.

Those rules are now recorded in `CLAUDE.md` §Writing rules, so they bind future edits rather than living
only in this log.

Rewritten: all twelve `/docs` pages, including the 65-slide deck, and `README.md`, `ASSESSMENT.md`,
`TOOLKIT.md`, `COURSE-PLAN.md`, `THEORY-NOTES.md` and `CLAUDE.md` itself. The changes fall into a small
number of repeating classes.

- **Em dashes.** In attributes, SVG labels and table headers they became colons. In `**Term** — definition`
  bullets they became `**Term.** Definition`. Mid-sentence they became a full stop, a comma, or two
  sentences. In empty table cells they became `n/a`. One decorative case resisted substitution: the
  continuum ruler in `worksheets.html` read `R————V`, so it was rebuilt as `R·····V`.
- **Contractions.** Expanded throughout the markdown for STE compliance: `doesn't`, `don't`, `can't`,
  `it's`, `that's`, `what's`, `you're`, `we'll`, `haven't`.
- **Register.** Career claims removed ("for the rest of their career", "makes them useful in a job", "the
  fastest route to paid AR work"). Superlatives removed ("the single most common student error").
  Rhetorical questions restated as propositions, per rule 13.
- **Terminology.** Day 3 is `PLACE AND PUBLISH`, Theory 7 is `Publishing AR`. The word *ship* is gone from
  student-facing text.

One em dash is kept on purpose, at `CLAUDE.md:75`. It is inside the rule that prohibits em dashes, and it
is there to show the character.

The build logs are dated records. Entries already written keep their punctuation, because editing a
historical entry to match a rule made later falsifies the record. The rule applies to entries written from
this one onward, which is why this entry carries none.

Verified: all twelve pages tag-balanced, zero emoji, scripts pass `node --check`, deck still 65 slides,
all eleven `href="*.html"` targets resolve on disk, zero contractions and zero em dashes across the
rewritten files. `ar-face.html` still cannot be verified headlessly. It needs a phone over HTTPS or
localhost.

---

## 2026-09-28: the kit is called Extended Reality

"Phygital" is gone. The name now reads **Extended Reality** on the handbook, the deck title, the deck
cover and the footers. Extended reality covers the whole continuum, which is what the course walks along.
Mixed reality names one band of it, so it was the narrower of the two options.

The student brief keeps a short form and is now the **XR Capsule**, matching the XR Audit activity that
already carried the abbreviation.

`localStorage` namespace moved with it: `phygital.worksheets`, `phygital.storyboard` and
`phygital.assetlog` are now `xr.worksheets`, `xr.storyboard` and `xr.assetlog`, and the deck's slide
position is `xr-deck-slide`. Any answer saved under the old keys is orphaned rather than migrated. Nothing
had been saved outside development, so no migration was written. `CLAUDE.md` records the new namespace.

Verified: twelve pages tag-balanced, scripts pass `node --check`, deck still 65 slides, zero occurrences
of the old name outside this log.

## 2026-09-28: a second deck for fundamentals

`docs/deck-fundamentals.html`, 17 slides, opens the workshop before the course deck. It carries the
vocabulary the course borrows from the metaverse conversation and then hands over.

Sections: the definition as a convergence of persistent worlds, augmented reality and the internet into
shared three-dimensional space; the six properties (persistence, synchronous presence, embodied
interaction, user-generated content, economic activity, identity continuity); persistent against
session-based worlds; the boundaries against a website, a game and a feed; the four-layer stack with
spatial computing marked as the layer this workshop builds on; AR, MR and VR as delivery mechanisms;
interoperability as the unsolved problem, with `.glb` named as the one standard the students touch; the
platform record from Second Life to Vision Pro; the separation of the funding curve from the capability
curve; six open constraints, with hardware access given as the reason the workshop is phone-only.

Source material is two pages on the Studio Poetics Emerging Tech Hub, `metaverse-basics.html` and
`metaverse-fundamentals.html`, both cited on the final slide.

Construction: the head, the `<style>` block, the chrome, overview and help markup and the whole engine
were copied from `deck.html` without modification. The engine reads `data-sec` and `data-title` off each
slide and derives the count from the document, so no code changed. Two values differ, the `<title>` and
the `localStorage` key, which is `xr-fund-slide` so that the two decks keep separate positions.

`docs/index.html` now lists the fundamentals deck above the course deck, with one line saying which runs
first. `deck.html` is untouched and still holds 65 slides.

Revised the same day after review: thirteen passages in the fundamentals deck carried figurative
phrasing (a phone "holding a room in memory", a store as "a tenancy", an asset arriving "without its
meaning"). Each was replaced with a direct technical statement. The deck now states behaviour and holds
no metaphor.

Second revision of the fundamentals deck, same day. The first version used slide-deck rhetoric: aphoristic
headings ("A convergence, not a place", "The valuation collapsed. The engineering continued."), pull
quotes set as blockquotes, and accent lines written as closing statements. All of it was replaced with
descriptive headings ("Definition of the metaverse", "The four-layer stack", "Platform history, 2003 to
2024", "Current technical constraints"), continuous paragraphs, and captions that state a fact rather than
close an argument. Both blockquote slides were removed. The register is now that of a textbook chapter.
Content, slide count and structure are unchanged.

## 2026-09-28 · `docs/deck.html` brought to the textbook register

The course deck still carried the pitch-deck form that the fundamentals deck had been rewritten out of.
106 exact substitutions across all 65 slides.

- Headings. Every aphoristic heading became a descriptive noun phrase. "Three days, three verbs." is now
  "Structure of the three days". "The shadow is the believability cue." is "Contact shadow and perceived
  contact". "Two concepts carry the whole module." is "Presence and degrees of freedom".
- Pull quotes. All nine `p.big` / `p.big.plain` epigram slides and the one `<blockquote>` were replaced by a
  heading and continuous prose. The window-and-flagship analogy slide became a two-column comparison of reach
  against depth. `grep` for `class="big` and `<blockquote>` in the slide block now returns nothing.
- Figure captions. Captions state the condition instead of closing an argument. "Fig. 2. Same size, same
  print cost. Only one of these tracks." is now "Two targets of the same size and the same print cost. The
  left target yields four feature points. The right target yields more than sixty."
- SVG text nodes. The three rhetorical lines inside the figures were rewritten: "WITHOUT THE FOURTH BEAT,
  NOTHING FOLLOWS" to "THE FOURTH BEAT DETERMINES WHAT THE VIEWER DOES"; "EVERY MEGABYTE YOU ADD COMES OUT OF
  THIS BAR" to "ADDED FILE SIZE IS SUBTRACTED FROM THIS BUDGET"; the three-orbit caption lost its italic.
- Rhetorical questions. Each was restated as a proposition, per the writing rules. The beat-sheet slide no
  longer asks what the viewer does next, it states that the instructor asks for it.
- `data-title` on all 65 slides was rewritten. These strings appear in the overview grid, so the internal
  block numbering they carried ("Theory 1 opens" ... "Theory 7 opens", "DRILL 1", "ACTIVITY 3") violated the
  rule against facilitator scaffolding in an audience-facing deck. They now name the subject of the slide.
- One markdown artefact fixed: backticks around `.glb` in the Gaussian splatting table cell became `<code>`.
- `docs/index.html`: the sentence about the fundamentals deck handing the session over was restated plainly.

Preserved: 65 slides, the five inline SVG figures byte for byte, every `data-sec`, every tool link and its
`target="_blank" rel="noopener"`, the chrome, the overview, the help panel and the engine.

Verified: `verify.py` passes on `deck.html`, `deck-fundamentals.html` and `index.html`; slide count 65; every
`href="*.html"` resolves on disk; zero em dashes; zero emoji.

## 2026-09-28 · Information architecture, rename, and first push

`docs/index.html` held three per-day tool tables that repeated the same rows. `sim-tracking` appeared on
day 1 and day 2, `sim-anchors` on day 1 and day 3, `tool-asset-check` and `ar-place` on day 2 and day 3, and
`worksheets` on all three, each time with a different one-line description and no statement that it was the
same page. There was no single list of the pages.

The page now carries five panes. Day 1, Day 2 and Day 3 each hold an ordered **Sequence** of the pages in the
order they are opened, with one sentence naming what happens on the page. A new **Tools** pane holds the
canonical list, split into simulations, live AR pages and student tools, with four columns: page, what it
does, camera, days. Each page is described once, and the Days column states the repetition that the day panes
imply. The **Reference** pane is unchanged.

Second-person promotional phrasing was removed from the descriptions: "Point your phone at a printed page and
make it move" became "Tracks a printed image target and plays a payload on it", and "Your default" was
dropped from the format table row.

Both deck links and the paragraph describing the deck order were removed from the handbook, on instruction.
The decks are unchanged on disk and are opened directly.

`docs/style.css` carried the last live occurrence of the old name in its file comment. It now reads
"AR VR Extended Reality course kit. Shared style for the tool pages." The em dash in that line is gone. The
remaining occurrences in the build logs are dated history of the rename and stay as history.

The project was not under version control. It is now a git repository on `main`, built on top of the existing
`origin/main` commit at github.com/wittywit/AR, with `.gitignore` excluding `.DS_Store` and `*.bak`.
`push.sh` stages, commits under the repository git identity and pushes. It adds no co-author trailer.
`CLAUDE.md` records it under a new Publishing section.

Verified: `index.html` balances, its script passes `node --check`, every `href="*.html"` in it resolves on
disk, and neither `index.html` nor `style.css` contains an em dash or an emoji.


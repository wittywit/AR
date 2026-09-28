# Extended Reality: AR for Fashion Communication

A nine-hour, phone-only AR course (3 days × 3 hours) for NIFT Fashion Communication students.
No headsets, no code, no accounts, no paid software.

## What is here

| File | What it is |
|---|---|
| `COURSE-PLAN.md` | The minute-by-minute facilitator script for all three days |
| `THEORY-NOTES.md` | Speaking notes for the seven theory blocks |
| `ASSESSMENT.md` | The brief, the 100-mark rubric, the worksheets, the jury card |
| `TOOLKIT.md` | Path A (phone only) vs Path B (commercial no-code), with INR costs |
| `docs/deck.html` | The presentation deck for the room. 65 slides, arrow keys or swipe |
| `docs/index.html` | The student handbook and hub linking every tool |
| `docs/*.html` | The simulations, the live AR pages, the printable worksheets |

## The tools

| Page | Day | Camera |
|---|---|---|
| `sim-continuum.html` | 1 | no |
| `sim-tracking.html` | 1 | no |
| `sim-anchors.html` | 1 / 3 | no |
| `ar-print.html` | 1 | **yes**, rear |
| `tool-storyboard.html` | 1 | no |
| `ar-face.html` | 2 | **yes**, front |
| `tool-asset-check.html` | 2 / 3 | no |
| `ar-place.html` | 2 / 3 | **yes**, native AR handoff |
| `sim-360.html` | 3 | no |
| `worksheets.html` | 1–3 | no |

Nothing on any of these pages uploads anything. Image analysis, model parsing and camera frames are all
handled on the device, and saved answers live in that browser's `localStorage`.

## Serving

Every page except the three camera pages opens fine by double-clicking the file.

**The camera pages need a secure origin.** Browsers refuse `getUserMedia` on `file://`. Serve the folder:

```sh
cd docs
python3 -m http.server 8000
```

Then open `http://localhost:8000/` on the same machine.

For phones, they must reach the laptop over a secure origin too. `http://192.168.x.x:8000` will **not**
get camera access. Three ways round it, in order of how little can go wrong on the day:

1. **Each student opens the page on their own phone from a hosted HTTPS copy** of `docs/`. Any static
   host works. Set it up the week before, not the morning of.
2. **A tunnel.** `cloudflared tunnel --url http://localhost:8000` gives a temporary HTTPS address
   that phones can open. Needs the room's wifi to be working.
3. **Fall back to the commercial Path B tools** in `TOOLKIT.md`, which are already served over HTTPS.
   This path has the fewest technical dependencies; it requires student accounts.

Test whichever one you choose, on a student's phone, before the first session. Not yours, a student's.

## Plan B: no network in the room

`ar-print.html` pulls A-Frame and MindAR from a CDN; `ar-face.html` pulls A-Frame and the 8th Wall
open-source engine; `ar-place.html` pulls `<model-viewer>`. If the room has no usable internet, vendor
them once, in advance:

```sh
mkdir -p docs/vendor docs/vendor/8thwall/resources
curl -L -o docs/vendor/aframe.min.js          https://aframe.io/releases/1.5.0/aframe.min.js
curl -L -o docs/vendor/mindar-image-aframe.js https://cdn.jsdelivr.net/npm/mind-ar@1.2.5/dist/mindar-image-aframe.prod.js
curl -L -o docs/vendor/model-viewer.min.js    https://ajax.googleapis.com/ajax/libs/model-viewer/3.5.0/model-viewer.min.js
curl -L -o docs/vendor/8thwall/xrextras.js    https://cdn.jsdelivr.net/npm/@8thwall/xrextras@1.0.0/dist/xrextras.js
```

The 8th Wall engine resolves its own extra files **relative to the URL of `xr.js`**, so its directory
layout has to be preserved: `xr.js`, the `xr-face.js` chunk, and the model files under `resources/`.

```sh
B=https://cdn.jsdelivr.net/npm/@8thwall/engine@0.1.0/dist
curl -L -o docs/vendor/8thwall/xr.js      $B/xr.js
curl -L -o docs/vendor/8thwall/xr-face.js $B/xr-face.js
for f in face-model.tflite face-mesh-model.tflite face-ear-model.tflite media-worker.js powered-by.svg; do
  curl -L -o docs/vendor/8thwall/resources/$f $B/resources/$f
done
```

Then point the pages at the local copies:

```sh
cd docs
sed -i '' 's#https://aframe.io/releases/1.5.0/aframe.min.js#vendor/aframe.min.js#' ar-print.html ar-face.html
sed -i '' 's#https://cdn.jsdelivr.net/npm/mind-ar@1.2.5/dist/mindar-image-aframe.prod.js#vendor/mindar-image-aframe.js#' ar-print.html
sed -i '' 's#https://cdn.jsdelivr.net/npm/@8thwall/engine@0.1.0/dist/xr.js#vendor/8thwall/xr.js#' ar-face.html
sed -i '' 's#https://cdn.jsdelivr.net/npm/@8thwall/xrextras@1.0.0/dist/xrextras.js#vendor/8thwall/xrextras.js#' ar-face.html
sed -i '' 's#https://ajax.googleapis.com/ajax/libs/model-viewer/3.5.0/model-viewer.min.js#vendor/model-viewer.min.js#' ar-place.html
```

`ar-print.html` also defaults to a demo image target hosted on a CDN. Offline, students must use their own
target, which is what Day 1 asks for anyway, so compile a `.mind` file per team beforehand at
<https://hiukim.github.io/mind-ar-js-doc/tools/compile> and keep the `.mind` and the printed card together.
`ar-place.html`'s demo model is also remote; offline, load a student `.glb` instead.

MindAR and model-viewer are MIT-licensed; keeping a local copy for classroom use is fine. Check licences
again if this is ever redistributed.

## Pre-flight, the day before

- Serve `docs/` and open every page once.
- Open `ar-print.html`, `ar-face.html` and `ar-place.html` on a **student's** phone, on the **room's** wifi.
- Print the target cards. Matte paper. Glossy paper under a ceiling light is the most common day-one failure.
- Check the projector shows `deck.html` at the size you expect, and that arrow keys work from where you stand.
- Have Path B accounts ready as the fallback.

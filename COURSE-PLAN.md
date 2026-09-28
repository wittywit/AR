# EXTENDED REALITY: No-Code AR for Fashion Communication
### 9-hour course · 3 days × 3 hours · NIFT Fashion Communication cohort

---

## 0. Constraints this plan is built around

| Constraint | Consequence for the design |
|---|---|
| **9 hours total, 3×3h** | Every day must end with a finished artifact. No "we will finish next week." |
| **No headsets. Phones only.** | AR is the whole spine. VR is taught as a 25-min literacy module experienced through a phone magic-window. No hardware, no purchase. |
| **No code** | Every drill has a **Path A (account-free, tools in `/docs`)** and a **Path B (commercial no-code platform)**. Students never see a text editor. |
| **Fashion Communication background** | Nothing is taught as "technology." Everything is taught as *lookbook, campaign, window display, styling, exhibition, crit*. Their existing visual-merch and layout instincts are the transferable skill. |
| **Mixed device ownership** | Every activity works on a mid-range Android or any iPhone. Nothing requires LiDAR. |

**Assumed:** each student has a smartphone with a working rear + front camera and mobile data/Wi-Fi. Laptops are *helpful but optional*. Path A covers every phone-only student.

---

## 1. The spine: one project, three artifacts

Students work in **teams of 2–3** on an **XR Capsule**, a 6-piece capsule collection for a brand they invent or already have in their portfolio.

Across the 3 days each team produces:

1. **The Living Lookbook.** A printed page that comes alive on camera (image-target AR)
2. **The Brand Filter.** A face or accessory AR effect carrying their own textile print
3. **The Placed Product.** Their hero product, 3D-scanned on a phone, placed at true scale in a real room (plane AR)

Plus, on Day 3: a **60-second case reel** and a **one-page campaign sheet**, which together document the campaign.

> The three artifacts map to the three things AR does commercially in fashion: **activate print**, **borrow a face**, **occupy a room.** A student who holds those three can read an AR brief and question it.

---

## 2. Vocabulary contract

Six words, introduced in the first 45 minutes and used consistently across all three days. The vocabulary is what a student uses to describe a fault to a developer without describing the symptom twice.

| Word | Plain meaning | Fashion example |
|---|---|---|
| **Trigger** | What starts the experience | The lookbook page, a face, the floor |
| **Anchor** | What the content is stuck to | The page, the nose bridge, the detected floor |
| **Tracking** | The camera continuously re-finding the anchor | Content stays glued while you walk around |
| **Occlusion** | Real things correctly hiding virtual things | Your hand passing in front of a virtual bag |
| **Drift** | The content sliding off its anchor | Virtual sneaker floating off the foot |
| **Payload** | The content that actually appears | The video, the 3D shoe, the price tag |

---

## 3. DAY 1: **SEE** · AR literacy and AR on the printed page

*Outcome by 3:00. Every student has published a working AR print piece and has a storyboard for the whole project.*

| Time | Min | Block | What happens |
|---|---|---|---|
| 0:00 | 10 | **Cold open** | Instructor hands out a printed lookbook page. Students point their own phones at it (QR → `docs/ar-print.html`). It comes alive. **No explanation given.** |
| 0:10 | 10 | Write-down | Each student writes 3 guesses: *how did the phone know?* Collect on the board. Do not correct yet. These misconceptions get resolved by 0:45, and that is the lesson. |
| 0:20 | 25 | **THEORY 1: The spectrum and the six words** | Reality–virtuality continuum; AR vs MR vs VR; the six-word contract above. Run **`sim-continuum.html`** live and let students place the campaigns themselves. |
| 0:45 | 15 | **SMALL ACTIVITY 1: "XR Audit"** | Pairs. 8 real fashion AR campaigns on the worksheet. For each: where on the continuum, what is the trigger, what does it actually *sell*. 10 min work + 5 min share. → `worksheets.html` |
| 1:00 | 10 | **Break** | |
| 1:10 | 15 | **THEORY 2: Why a target works or fails** | Feature points, contrast, uniqueness, glare, reprint scale, the flat-gradient trap. Run **`sim-tracking.html`** and break a target live. |
| 1:25 | 15 | **SMALL ACTIVITY 2: "Target Clinic"** | Each student runs **3 images from their own portfolio** through `sim-tracking.html`. Score them. Take the worst one, fix it (add texture, contrast, asymmetry) in Canva/Photoshop/phone editor, re-score. Deliverable: before/after screenshot with scores. |
| 1:40 | 35 | **SKILL DRILL 1: Build a Living Lookbook page** | **Path A (phone-only, no account):** `docs/ar-print.html`. Drop in own target image + reveal video, generate link + QR. **Path B:** ZapWorks Designer or Artivive for a managed, analytics-tracked version. Everyone tests on **three different phones**, including a neighbour's. |
| 2:15 | 15 | **BIG PROJECT LAUNCH** | Hand out the XR Capsule brief (`ASSESSMENT.md`). Form teams. Assign or claim brands. |
| 2:30 | 25 | **Storyboard sprint** | **`tool-storyboard.html`**. Fill the AR beat sheet (Trigger → Reveal → Payoff → Action) for all three artifacts. Instructor floor-walks, 1 minute per team, one question each: *"what does the viewer do next?"* |
| 2:55 | 5 | Homework brief | Shoot 6 flat-lays. Pick **one hero object** to 3D-scan (matte, rigid, textured, see Day 2 rules). Export brand type + colour kit. |

**Day 1 failure mode to watch for:** students designing a *beautiful* target instead of a *trackable* one. The Target Clinic exists specifically to break that habit on day one, before it costs them a project.

---

## 4. DAY 2: **WEAR** · Face and body AR, and capturing 3D with a phone

*Outcome by 3:00. A published brand filter and a clean, mobile-ready 3D scan of the hero product.*

| Time | Min | Block | What happens |
|---|---|---|---|
| 0:00 | 10 | Recap | Three teams pitch their beat sheet in 90 seconds each. |
| 0:10 | 25 | **THEORY 3: The face and body as a canvas** | Landmarks and face mesh; body segmentation; **what try-on genuinely does and does not do**: eyewear, jewellery, makeup, sneakers, bags, headwear work; drape-critical garments (a bias-cut dress, a draped saree, anything whose meaning *is* the fall of the cloth) do not, and why. Then the **ethics block**: body-image harm, skin-tone and body-shape bias in trackers, face data and consent, the difference between a playful filter and a covert beauty filter. 5-min structured discussion: *"Would you put this filter on a 14-year-old?"* |
| 0:35 | 40 | **SKILL DRILL 2: The Brand Filter** | **Path A (phone-only):** `docs/ar-face.html`. Anchor their own textile-print PNG to the face, position it, live camera test. **Path B (laptop):** Snap Lens Studio or TikTok Effect House. Start from a face-mask or accessory template, replace the texture with their own print, add the logo, add exactly **one** interaction (open mouth, then reveal). Publish and test on a real face that is not their own. |
| 1:15 | 10 | **Break** | |
| 1:25 | 15 | **THEORY 4: 3D without modelling** | Photogrammetry vs Gaussian splats vs LiDAR, in plain language. What scans well (matte, rigid, textured, opaque) and what destroys a scan (gloss, transparency, thin edges, fur, anything that moves). Formats: `.glb` for the web and Android, `.usdz` for iOS. Mobile budgets: **≤100k triangles, ≤2048px textures, ≤10 MB**. |
| 1:40 | 30 | **SKILL DRILL 3: Scan the hero product** | Polycam or Scaniverse (both free, both phone-only). Method: **3 orbits at 3 heights**, even diffuse light, object on a contrasting matte surface, move the camera not the object. Export `.glb` + `.usdz`. Run through **`tool-asset-check.html`**. It must pass before Day 3. View in real AR via **`ar-place.html`**. |
| 2:10 | 15 | **SMALL ACTIVITY 3: "Worst Scan Wins"** | Teams deliberately scan the hardest thing in the room: sequins, chiffon, patent leather, a glass bottle, a fur trim. Post results to the shared board. Class diagnoses each failure and **names the material property responsible.** Prize for the most instructive failure. This teaches material limits in 15 minutes in a way a lecture cannot. |
| 2:25 | 30 | Build time | Filter finished and published. Print AR finalised. Scan cleaned and passing the asset check. Instructor triages. |
| 2:55 | 5 | Homework brief | 60-word campaign narrative. One 15-second vertical hero video for the lookbook reveal. |

**Day 2 failure mode to watch for:** a whole hour lost to a scan of something glossy. Enforce the material rules *before* scanning starts. That is why Theory 4 precedes Drill 3 and why "Worst Scan Wins" is scheduled *after* the real scan, not before.

---

## 5. DAY 3: **PLACE AND PUBLISH** · World AR, publishing, and the showcase

*Outcome by 3:00. All three artifacts live, a 60-second reel, a campaign sheet, and a public crit.*

| Time | Min | Block | What happens |
|---|---|---|---|
| 0:00 | 10 | **Asset gate** | Every team shows a green `tool-asset-check.html` result. No green, no placement drill. They fix it during Theory 5. |
| 0:10 | 20 | **THEORY 5: World AR and spatial composition** | Plane detection; **true scale** (1 unit = 1 metre, the error students make most often); anchors and drift; lighting estimation; **shadow is the number-one believability cue**. Then the transfer they already own: threshold, sightline, focal hierarchy, dwell point: the visual-merchandising vocabulary, applied to a virtual object in a real room. |
| 0:30 | 35 | **SKILL DRILL 4: The Placed Product** | **`docs/ar-place.html`**. Load the scan, correct true scale, check shadow contact, walk around it to test drift. Then shoot a 10-second capture in a retail-like setting (a real shop window, a corridor, a table). |
| 1:05 | 15 | **THEORY 6: VR in 15 minutes, no headset** *(the immersive-literacy module)* | Presence; 3DoF vs 6DoF; why sim sickness happens and what causes it; why a headset brief is a *different brief* with different budgets. Experienced hands-on through **`sim-360.html`** as a phone magic-window. Framed honestly: *"this is what you need to know when a client says the word VR."* |
| 1:20 | 10 | **Break** | |
| 1:30 | 20 | **THEORY 7: Publishing AR** | WebAR vs app vs platform-native (Snap / TikTok / Instagram): the real trade-offs. QR and link design. **The 8-second rule.** Where the instruction line goes on the printed piece. What analytics to ask a vendor for. What a client actually receives on handover. |
| 1:50 | 40 | Final build & publish | QR codes generated and placed on the print piece. 60-second case reel cut on phone (CapCut/InShot). One-page campaign sheet. |
| 2:30 | 5 | Station setup | Each team sets up: printed piece, phone on a stand, reel queued. |
| 2:35 | 23 | **JURY / SHOWCASE** | 4 minutes per team: printed piece passed around the room, filter demoed live on a volunteer's face, product placed on the jury table, reel played. Peer scoring on the rubric in `ASSESSMENT.md`. |
| 2:58 | 2 | Close | AR career map for fashion communication + a next-90-days learning path. |

**If you are running behind:** the trimmable blocks, in order, are Theory 7 (→10 min), Theory 6 (→10 min), and the Day 3 reel (→ homework). Never trim the jury. The public crit is where the learning consolidates.

---

## 6. Where each tool in `/docs` is used

| File | Day | Block | Camera? |
|---|---|---|---|
| `sim-continuum.html` | 1 | Theory 1 | no |
| `sim-tracking.html` | 1 | Theory 2 + Activity 2 | no |
| `sim-anchors.html` | 1 / 3 | Theory 2, Theory 5 | no |
| `ar-print.html` | 1 | Cold open + Drill 1 | **yes** (rear) |
| `tool-storyboard.html` | 1 | Storyboard sprint | no |
| `ar-face.html` | 2 | Drill 2 Path A | **yes** (front) |
| `tool-asset-check.html` | 2 / 3 | Drill 3, asset gate | no |
| `ar-place.html` | 2 / 3 | Drill 3, Drill 4 | **yes** (native AR) |
| `sim-360.html` | 3 | Theory 6 | no |
| `worksheets.html` | 1–3 | all activities, printable | no |

Camera pages require **HTTPS or localhost.** See `README.md` §Serving.

---

## 7. Instructor pre-flight (do this the day before, not on the morning)

- [ ] Serve `/docs` over HTTPS and test **every camera page on both an iPhone and an Android**, on the venue Wi-Fi.
- [ ] Print the cold-open target at A5 on **matte** paper. Glossy paper + ceiling lights = a dead demo in front of 30 people.
- [ ] Print 10 spare targets, 30 worksheet sets, 10 brief sheets.
- [ ] Pre-create accounts for Path B tools yourself and check that the free-tier limits have not changed (`TOOLKIT.md`).
- [ ] Charge 2 power banks. Phone AR eats battery; a dead phone during the jury is the most likely failure.
- [ ] Download the offline fallback bundle (`README.md` §Plan B) in case the venue Wi-Fi dies. Assume it will.
- [ ] Check the room: even diffuse light for scanning, one matte contrasting surface, no strong backlight behind the demo target.

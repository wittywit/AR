# Toolkit: every tool, both paths, real costs

**Rule for this course:** nothing that requires a headset, a paid licence, or a line of code.
Every drill has **Path A** (works on a phone alone, no account, runs from `/docs`) and **Path B** (a commercial no-code platform, better polish, needs an account and usually a laptop).

Path A exists so that a student with only a phone and no signup is never blocked. Path B exists because it is what they will actually be asked to use in a job.

---

## 1. The stack

### Image-target AR (print → alive)
| | Tool | Device | Cost | Notes |
|---|---|---|---|---|
| **A** | `docs/ar-print.html` (this kit) | Phone browser | Free | No account. Their own target + video. Link/QR shareable. |
| B | **ZapWorks Designer** | Browser, laptop preferred | Free tier; paid plans in USD | Drag-and-drop, hosted WebAR, analytics. The closest thing to an industry-standard no-code AR tool. |
| B | **Artivive** | Browser + desktop bridge | Free for students/artists | Built for print and exhibition. Fastest path from an artwork to AR. Very popular in art/design schools. |
| B | **Blippbuilder** | Browser | Free education tier | Heavier, more template-driven. |

### Face / accessory AR (the brand filter)
| | Tool | Device | Cost | Notes |
|---|---|---|---|---|
| **A** | `docs/ar-face.html` (this kit) | Phone browser | Free | Runs 8th Wall's own face tracker in the browser. Attaches their PNG to a named landmark and can draw the tracked mesh. No account, no publishing, nothing uploaded. |
| B | **Snap Lens Studio** | Laptop (Win/Mac) | Free | Strongest template library for jewellery, eyewear, headwear. Publishes a Snapcode. |
| B | **TikTok Effect House** | Laptop (Win/Mac) | Free | Node-based visual logic, no typing. Best distribution for a fashion audience. |

**On the 8th Wall engine.** 8th Wall was the standard commercial WebAR platform; Niantic withdrew the hosted
service in **February 2026** and released the engine under the **MIT licence** at `github.com/8thwall/8thwall`,
with documentation at `8thwall.org`. That is why a Path A page can now use a professional face tracker with no
account and no build step: `docs/ar-face.html` loads `@8thwall/engine` and `@8thwall/xrextras` from a public CDN
and runs entirely on the device.

Two limits worth stating in class. The open-source release **excludes SLAM world tracking, VPS, Lightship Maps
and hand tracking**, which live in a separately licensed binary, so Day 3's plane placement stays on
`<model-viewer>` and the platform's native AR handoff. And image-target tracking on 8th Wall needs compiled
target files, so Day 1's `ar-print.html` stays on MindAR.

> **Meta Spark Studio (Instagram/Facebook filters) is discontinued. Do not build the course on it.** If a student asks "why not Instagram filters," that is the answer. Paired with the 8th Wall shutdown it is the clearest lesson in platform risk the course has: one platform closed and took every effect with it, the other closed but left the engine behind.

### 3D capture (phone → product)
| | Tool | Device | Cost | Notes |
|---|---|---|---|---|
| **A** | **Polycam** | iOS + Android | Free tier (exports limited); Pro subscription | Photo mode works on any phone. LiDAR mode only on Pro iPhones/iPads, **not required.** |
| **A** | **Scaniverse** | iOS + Android | Free | Free exports. Excellent fallback when Polycam's free tier gets in the way. |
| n/a | `docs/tool-asset-check.html` (this kit) | Any browser | Free | Validates the export against mobile budgets before it wastes class time. |

### Placing in the room (world AR)
| | Tool | Device | Cost | Notes |
|---|---|---|---|---|
| **A** | `docs/ar-place.html` (this kit) | Phone | Free | Hands the model to **Scene Viewer** (Android) or **AR Quick Look** (iOS), the AR viewers already built into the phone. Nothing to install. |

### Immersive literacy (no headset)
| | Tool | Device | Cost | Notes |
|---|---|---|---|---|
| **A** | `docs/sim-360.html` (this kit) | Phone browser | Free | Magic-window 360. Demonstrates presence, 3DoF and the causes of simulator sickness without hardware. |
| B | **Blockade Labs Skybox AI** | Browser | Free tier | Generates a 360 environment from a text prompt. Feed the result into `sim-360.html`. |

### Supporting
| Tool | Use | Cost |
|---|---|---|
| **Canva** | Fixing targets, campaign sheet, QR placement on the print piece | Free |
| **CapCut / InShot** | The 60-second case reel, on a phone | Free |
| **Any QR generator** | Link → printed piece | Free |

---

## 2. What this costs in India

**Software: ₹0.** Every Path A tool and every Path B free tier covers the full 9 hours. Nothing in this course requires a paid plan.

**Optional consumables, per cohort of 30:**

| Item | Where | Approx. |
|---|---|---|
| A5 matte prints for targets (~60 sheets) | Local print shop | ₹300–600 |
| Worksheet + brief printing (~150 sheets B/W) | Local print shop | ₹150–300 |
| 2 phone tripods / clamps for the jury stations | Amazon.in / Flipkart | ₹500–1,500 |
| 2 power banks (10,000 mAh) | Amazon.in / Flipkart | ₹1,500–3,000 |
| A matte neutral cloth/board for scanning | Local | ₹200–400 |

**Total realistic spend: roughly ₹2,500–6,000 for the whole cohort**, and half of that is printing.

**Hardware deliberately excluded.** For reference only, if the department later asks about headsets: a Meta Quest 3S 128 GB lands around **₹45,000** on Amazon.in/Flipkart via third-party importers (Meta does not sell officially in India, so pricing swings. It has ranged roughly ₹32,000 to ₹50,000, and Meta raised global prices in April 2026). Phone-holder "cardboard" viewers start near **₹500**. **Neither is required for this course.** The work above is done on the phones students already carry, which is also the constraint under which most commercial briefs operate.

---

## 3. Free-tier traps to check the week before class

Free tiers move. Verify these before teaching, because each one can silently kill a drill:

- **Polycam.** How many free exports, and in which formats, this month.
- **ZapWorks / Artivive.** Project count limit on the free plan; whether the education tier still needs an application (apply 2 weeks ahead if so).
- **Lens Studio / Effect House.** Current minimum OS version for the desktop app, and whether publishing requires account verification (it sometimes takes 24h, so have students create accounts as Day 1 homework, not on Day 2).
- **Skybox AI.** Remaining free generations on a shared account; consider one account per team.
- **8th Wall open-source engine.** `docs/ar-face.html` pins `@8thwall/engine@0.1.0` and `@8thwall/xrextras@1.0.0` on jsDelivr. The engine is a `0.1.x` pre-release, so its component names and attributes can still change; pinned versions do not move, but confirm the page still tracks a face on a phone before Day 2, and keep the vendored copies in README §Plan B current.

---

## 4. Device reality check

| Situation | What to do |
|---|---|
| Old Android, no ARCore support | Path A `ar-print.html` and `ar-face.html` still work (they use the plain camera). Only `ar-place.html` needs ARCore. Pair that student with a team-mate whose phone supports it. |
| iPhone, any model | Everything works. `ar-place.html` uses AR Quick Look, built into iOS. |
| No LiDAR | Irrelevant. Photo-mode scanning covers the whole course. |
| Phone storage full | Predictable and common. Warn students on Day 1 to clear 2 GB before Day 2. |
| Cracked front camera | `ar-face.html` will be unreliable. Use Path B on a laptop webcam. |

---

## 5. What to learn after this course

For a fashion communication graduate who wants to go further, in order:

1. **Lens Studio / Effect House, properly.** The route most used for paid AR work in fashion and beauty.
2. **Polycam to glb hygiene.** Clean, lightweight product scans are a billable skill on their own.
3. **Spline** (browser, no-code 3D), for web 3D and AR-adjacent campaign pages.
4. **A briefing vocabulary.** The six words from Day 1, plus the delivery trade-offs from Theory 7. This equips the student to brief an AR studio rather than to execute the build, which is the role a fashion communication graduate is most likely to occupy.

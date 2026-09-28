# Theory notes: what to actually say

Speaking notes for the seven theory blocks. Written to be taught to a fashion communication cohort with no technical background. Every concept is anchored to something they already do.

---

## THEORY 1: The spectrum and the six words *(Day 1, 25 min)*

**Open with the misconceptions from the board.** Most will say "it scanned a code" or "the picture is a video." Both wrong, both useful.

**The continuum.** There is no AR/VR binary. There is a line from *entirely real* to *entirely virtual*, and every campaign sits somewhere on it.

- **AR.** Your real room, with virtual things added. Phone, no hardware.
- **MR.** Virtual things that *behave as though* they know about your room: they sit on the table, they go behind the sofa. A difference of believability, not category.
- **VR.** Your room replaced entirely. Requires a headset to be real VR; anything on a flat screen is a 3D experience, not VR.

*Fashion translation:* AR is a **window display**, VR is a **flagship store**. One augments a street you were already walking down. One you must decide to enter. That single analogy carries the rest of the course.

**The six words.** Teach with a live prop: the printed cold-open target.

- **Trigger.** What starts it. Point at the page: *this is the trigger.*
- **Anchor.** What the content is stuck to. *The content is stuck to this page. Move the page, and it follows.*
- **Tracking.** The camera re-finding the anchor 30–60 times a second. *This is why it does not slide.*
- **Occlusion.** The real correctly hiding the virtual. Put a hand in front. *It should go behind your hand. It does not. That is the tell that it is fake.*
- **Drift.** Content sliding off the anchor. Tilt the page to a hard angle until it breaks. **Break it deliberately, in front of them.** Students who have seen it break are the ones who design for it.
- **Payload.** The content itself. *The payload is a video. It could have been a 3D shoe. The payload is a creative decision; the other five are constraints.*

**Landing line:** *You will not build the tracking. You will decide the trigger and design the payload. Those are both design jobs, and they are yours.*

---

## THEORY 2: Why a target works or fails *(Day 1, 15 min)*

The phone does not "see a picture." It finds **feature points**: small high-contrast, asymmetric patches it can recognise again from an angle. Corners, edge junctions, the join between two textures.

What makes a good target:
- **Contrast.** Local light/dark transitions. Not overall brightness.
- **Detail spread evenly** across the frame, not clustered in one corner.
- **Asymmetry.** A symmetric target confuses orientation, so content pops between rotations.
- **Uniqueness.** Repeated patterns (stripes, houndstooth, a regular grid) are the classic fashion trap. Every repeat looks like every other repeat; the phone cannot tell which one it is looking at.
- **Matte.** Glossy stock plus one ceiling light equals a blown-out highlight and zero features.

What kills a target is almost exactly what a fashion communication student is trained to make beautiful:

| Their instinct | Why it fails as a target |
|---|---|
| Elegant white space | No features to find |
| Soft gradient backdrop | No contrast transitions at all |
| A clean repeating print | Not unique. Every tile looks identical |
| Minimal type on a flat field | Detail clustered in one small area |
| Glossy premium stock | Specular highlight wipes out the features |

**Say this out loud:** *A beautiful page and a trackable page are not the same page. Your job is to make one page that is both. That is a design problem, and it is the actual skill of this day.*

Run `sim-tracking.html`. Feed it a gradient and the score collapses. Feed it a dense textile photograph and the score rises. Then fix the gradient live by adding a textured band and an asymmetric mark, and re-score.

---

## THEORY 3: The face and body as a canvas *(Day 2, 25 min)*

**How it works.** The phone fits a **mesh** onto the face, a standard grid of a few hundred to a few thousand points, and re-fits it every frame. Landmarks (eye corners, nose bridge, jaw) are fixed addresses on that mesh. When you "place earrings," you are parenting an image to an address. The mesh also deforms, which is how a texture can stretch with a smile.

For bodies there is **segmentation**. The phone separates person-shaped pixels from background-shaped pixels. That's what lets a virtual garment appear "on" someone. Note what this means: it is a cut-out, not an understanding of a body.

**What try-on actually does well:**
- Eyewear, earrings, necklaces, headwear. Rigid, anchored to reliable landmarks
- Makeup. A texture blended onto a surface
- Sneakers. Foot tracking is a solved, specialised problem
- Bags and watches. Rigid objects held in predictable positions

**What it does badly, and why:**
- Anything drape-critical. A bias-cut dress, a draped saree, a wide-leg trouser in motion. **The meaning of the garment *is* the fall of the cloth**, and simulating cloth on a live phone camera in real time is genuinely hard. What ships is usually a flat cut-out that slides over the body and looks it.
- Fit. AR try-on shows you a *look*, not a *fit*. The commercial consequence is returns, which is why this matters to a brand.

**Say this:** *When a brand tells you their AR try-on solves returns, ask them whether it is showing look or fit. The distinction is the one to hold on to.*

**The ethics block. Do not skip it, 8 minutes minimum.**
- **Body-image harm.** Beauty filters that subtly reshape a face are the default in many templates. Subtle is worse than obvious: an obvious filter is a costume, a subtle one is a standard you are quietly asked to meet.
- **Bias.** Face and body trackers are trained on datasets. They have historically performed worse on darker skin tones, on larger bodies, on faces with visible disabilities. **Test on more than yourself.** For an Indian cohort this is not abstract. Test across the skin-tone range in your own classroom.
- **Consent and face data.** What does the platform keep? Whose face is in your demo, and did they agree to it being posted?
- **Cultural weight.** Garments in an Indian context carry religious and ceremonial meaning. A filter that puts a sacred garment on anyone for a laugh is a brand risk before it is a design choice.

*Discussion prompt (5 min):* **"Would you put this filter on a 14-year-old?"** Make each team answer for their own filter, out loud.

---

## THEORY 4: 3D without modelling *(Day 2, 15 min)*

Three ways a phone makes 3D. They only need to know which to pick.

- **Photogrammetry.** Take many photos, software finds matching points, builds a mesh with a photographic texture. Works on any phone. This is the default for this course.
- **LiDAR.** Some iPhones/iPads project infrared dots and measure depth directly. Faster, better on plain surfaces, worse on fine texture. **Not required here.**
- **Gaussian splatting.** A newer capture that stores a cloud of soft blobs instead of a mesh. Looks spectacular, including on shiny things. Harder to hand to a client as a normal 3D file. Show one, do not build one.

**What scans well:** matte, rigid, opaque, textured, evenly lit. A canvas tote. A leather boot. A woven bag. A shoe with visible stitching.

**What destroys a scan, and the property responsible:**

| Object | Property | What happens |
|---|---|---|
| Patent leather, sequins | Specular reflection | The surface looks different from each angle, so no point matches, and the mesh has holes |
| Glass, organza | Transparency | The software reconstructs what is *behind* it |
| A thin strap, an earring hook | Thinness | Falls below the reconstruction threshold and vanishes |
| Fur, mohair | Fine self-occluding detail | Turns to mush |
| A dress on a person | Movement | Every photo is a different object, so the scan fails |

**Formats:** `.glb` for the web and Android. `.usdz` for iOS AR Quick Look. Export both; it takes one extra tap and prevents an hour of confusion.

**Mobile budgets.** Write these on the board: **≤100k triangles, ≤2048px textures, ≤10 MB total.** A scan straight out of the app usually breaks all three. This is why `tool-asset-check.html` exists.

---

## THEORY 5: World AR and spatial composition *(Day 3, 20 min)*

**Plane detection.** The phone looks for flat, textured surfaces and proposes them as planes. A plain glossy floor is nearly invisible to it. Same failure as a bad target, same reason. Content placed before a plane is confidently found will drift.

**True scale.** In every 3D tool, **1 unit = 1 metre.** The most frequent student error is a bag scanned at the wrong scale, which then appears in the room at the size of a car. Demonstrating the error once, then correcting it, fixes the concept more reliably than stating it.

**Shadow is the believability cue.** Not resolution, not polygon count. A contact shadow where the object meets the floor is the difference between "sitting there" and "pasted on." If one thing improves their placed product, it is the shadow.

**Occlusion, revisited.** Most phone AR does not properly hide virtual objects behind real ones. Design around it: place objects in open space, avoid shots where a hand or a doorway crosses the object.

**Then the part they already know.** Everything from visual merchandising transfers directly:
- **Threshold.** The first two seconds after it appears. What does the viewer see first?
- **Sightline.** What height is it placed at? Eye level sells; floor level explains.
- **Focal hierarchy.** One hero. AR makes it very tempting to place five things. Place one.
- **Dwell point.** Name what makes someone walk *around* it. That is the only thing AR offers that a photograph does not. If nothing rewards walking around it, **you did not need AR.**

**Landing line:** *You have been trained to compose a window. This is a window that the customer can walk into and around. The vocabulary is the same; the only new variable is that you no longer control the viewpoint.*

---

## THEORY 6: VR in 15 minutes, no headset *(Day 3, 15 min)*

Framed honestly: *you have no headsets, so you will not build VR this week. You will learn enough to say what VR costs and what it is for.*

- **Presence.** The feeling of *being there*, not of looking at a picture of there. It is fragile: a wrong-scale door, a floating horizon, or absent sound breaks it instantly. Presence, not resolution, is the product.
- **3DoF vs 6DoF.** 3DoF: you can look around but not move (a 360 photo, a phone in a viewer). 6DoF: you can also walk. The gap between them is most of the budget.
- **Sim sickness.** Happens when your eyes report motion your inner ear does not. Caused by smooth artificial movement, low frame rate, and latency. The mitigations are teleport movement, a locked horizon, and high frame rate. **This is a real accessibility constraint, and it affects women more often in the published data, which is relevant for a fashion audience.**
- **Why a headset brief is a different brief:** the audience must own hardware, put it on, and be alone in it. AR reaches everyone already holding a phone. **For fashion communication, that is usually the deciding argument**, and now they can make it in a meeting.

**Hands-on (8 min):** `sim-360.html` on their phones. Hold it up, turn around. That is 3DoF. Try to walk toward something, and you cannot. *Now you have felt the limit, which is the whole lesson.*

---

## THEORY 7: Publishing and distribution *(Day 3, 20 min)*

**The three routes, honestly:**

| Route | Reach | Quality | Cost | Use when |
|---|---|---|---|---|
| **WebAR** (a link) | Highest, anyone with a browser | Good, not spectacular | Lowest | Print, packaging, out-of-home, anything reaching strangers |
| **Platform-native** (Snap / TikTok) | High within that audience | Excellent tracking | Low | Youth-facing campaigns, virality is the goal |
| **App** | Lowest, requires an install | Best possible | Highest by far | Owned-customer, repeat use, commerce |

*Rule of thumb for them:* **if a stranger must install something to see your campaign, your campaign is over.**

**The 8-second rule.** From spotting the printed piece to seeing the payload, you have about eight seconds before most people give up. Budget it: 2s to understand what to do, 2s to open the camera, 2s to load, 2s to track. Which means: instruction line must be legible from a metre, the payload must be small, and the target must track instantly.

**Design of the print piece itself:**
- The instruction line ("Point your camera here") is part of the layout, not an afterthought. Placement, weight, and type are a design decision.
- The QR must survive being printed small and photographed at an angle. Test it printed, not on screen.
- **The page must work if nobody scans it.** Print that only makes sense with AR is a failed print.

**What to ask a vendor for.** The briefing checklist:
1. Scan-to-content time on a mid-range Android, not a flagship.
2. Fallback behaviour when tracking is lost. State what the user sees.
3. Analytics: scans, completions, drop-off point.
4. Who hosts it, for how long, and what happens at the end of the campaign.
5. File handover: do you get the source, or just a link that dies?

**Landing line for the whole course:** *You are unlikely to be the person who builds the AR. You are very likely to be the person who decides whether it should exist, what it should do, and whether what came back is good enough. That is what these nine hours were for.*

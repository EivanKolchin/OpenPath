<div align="center">

# 🧭 OpenPath

### Connecting the dots.

**An open intelligence platform for planet Earth.** A live 3D globe, place-anchored communities, and a multi-source search engine that reads the open web, the archives, and what quietly disappeared from both.

*No place left behind. No source left unchecked.*

**Forked from [God's Eye View](https://github.com/bilawalsidhu/gods-eye-view) by [Bilawal Sidhu](https://github.com/bilawalsidhu) and [Sameh Khamis](https://github.com/samehkhamis) — MIT licensed. Full credit in [Acknowledgements](#-acknowledgements).**

</div>

---

<div align="center">

**[Quick Start](#-quick-start) · [The Three Surfaces](#-the-three-surfaces) · [Geo](#-geo--the-live-globe) · [Social](#-social--communities-anchored-to-places) · [Search](#-search--the-corroboration-engine) · [Tags](#-intelligence-tags--spotlight) · [Roadmap](#-roadmap) · [Keys & Costs](#-api-keys)**

</div>

---

## 🌍 Why OpenPath Exists

God's Eye View made a point that stuck: the feeds that look classified are mostly public. Flight transponders, ship beacons, orbital elements, seismographs, and street cameras are all out there, and putting them on one globe feels like walking into an ops room you shouldn't have badge access to.

**OpenPath takes that foundation and moves it from a simulator to a source.**

A globe that renders live signals beautifully is a viewer. What turns a viewer into intelligence is three things it doesn't have yet:

1. **People who know the place.** A satellite pass tells you a facility expanded. Someone who lives two streets away tells you when the trucks started arriving. OpenPath puts those in the same interface.
2. **Everything ever written about it.** One search engine is one index, with one set of removals and one ranking bias. Six engines plus the archives is a corpus — and the gaps between them are themselves a signal.
3. **Memory.** The present is the cheap part. The expensive, valuable part is *what changed*: the page that said something different last year, the record that was there and isn't, the number that got quietly revised.

OpenPath is a local-first, inspectable client for all three. It runs in your browser, on public data, with every line of code readable.

> The globe shows you where. The communities tell you what it's actually like. The search tells you what everyone has said about it — and what someone later decided you shouldn't read.

**Status markers used throughout this README:**

| Marker | Meaning |
|---|---|
| **`LIVE`** | Shipped and working today — inherited from God's Eye View, or built here |
| **`BUILDING`** | Actively under construction |
| **`DESIGNED`** | Specified and scoped, not yet implemented |

Nothing below is claimed as working unless it is marked **`LIVE`**.

---

## 🧭 The Three Surfaces

OpenPath is one application with three tabs. They share a single entity model, so a place you find in Search is the same object you can fly to on the Geo tab and the same object a community is anchored to.

| Tab | What it is | Status |
|---|---|---|
| **🌍 GEO** | The live 3D globe. Aircraft, vessels, satellites, fires, cameras, seismic activity, infrastructure — plus tagged sites of intelligence interest, and chat pinned to real coordinates. | **`LIVE`** globe · **`DESIGNED`** tags and pinned chat |
| **💬 SOCIAL** | Communities, the way forums and subreddits work — except any of them can be bound to a geography, so what reaches your feed depends on where you're looking. | **`DESIGNED`** |
| **🔎 SEARCH** | Fan-out across many engines, socials, and archives; deduplicated, entity-resolved, summarised by an LLM, with contradictions and deletions flagged rather than smoothed over. | **`DESIGNED`** |

The three feed each other. A flagged deletion in Search drops a marker on the Geo tab. A community thread about a substation links to the substation entity. A tagged site on the map carries a *"what has been written about this"* action that runs the Search pipeline against it.

---

## ⚡ Quick Start

**Start without an account or API keys.** You get Esri satellite imagery and keyless terrain, with OSM as the fallback if Esri is unreachable. Flights, military traffic, satellites, earthquakes, public cameras, radio, and launches all work with no keys at all.

For photorealistic 3D, add a **Cesium ion token** for eligible personal, non-commercial use, or a **Google Maps key** for the direct, metered route and in-app place search. Provider terms and quotas apply. Add keys through the app's **POWER UP** panel; [Keys & Costs](#-api-keys) explains the options.

Use **Node.js 24.x (24.14.0 or later) or 26.x**. The setup doctor warns about Node 25, which is end-of-life.

### Path 1 — Windows, one double-click

Double-click **`start.bat`** in the repository root. It checks for Node and npm, installs the locked dependencies if they are missing or incomplete, and opens the app in your browser.

### Path 2 — Terminal / coding agent

```bash
git clone https://github.com/EivanKolchin/gods-eye-view-fork.git
cd gods-eye-view-fork
npm ci
npm run doctor
npm run dev
```

Open **`http://localhost:4173`**. Choose **Live Contacts**, **Space Missions**, **Environmental**, or **Explore Manually** from the first-run panel.

**macOS shortcut:** `./scripts/dev-fresh.sh` clears the Vite cache and pulls any configured keys straight from the Keychain. It starts keyless too.

<details>
<summary>Startup performance</summary>

A point-in-time M5/Chrome capture measured a median 1.86-second cold start. This is a comparison baseline, not a guarantee for your machine or connection. See [docs/PERFORMANCE.md](docs/PERFORMANCE.md).

</details>

### Path 3 — Pinokio

> ⚠️ The [Pinokio listing](https://pinokio.co/apps/github-com-bilawalsidhu-gods-eye-view) installs **upstream God's Eye View**, not OpenPath. It is the fastest way to see where this project came from, but it will not give you anything on this page marked **`BUILDING`** or **`DESIGNED`**. An OpenPath listing is planned. Requires Pinokio **8.2 or later**; earlier versions fail to install.

### Then power it up — in the app, not in a file

Keys are upgrades, not prerequisites. When you want one, click the **POWER UP** chip in the bottom-right corner: Provider Settings lists every supported key, what it switches on, and where to get it. Paste, hit **SAVE KEYS**, and the app restarts itself with the new capability on. Once everything is configured the chip reads **POWERED UP** — and if a compact layout hides it, `?setup=1` reopens the same panel.

- **Where keys land:** Pinokio to the app's ignored `pinokio/ENVIRONMENT`; a terminal clone to the repo-root `.env`. Either file is made owner-only *before* a secret is written into it. These are local plaintext files, excluded from Git; the app uses your keys to contact the providers.
- **Keys you already have stay yours:** values from your shell or the macOS Keychain show as *configured externally* and are read-only to the panel.
- **What to get first:** the free [Cesium ion](https://cesium.com/ion) token (eligible personal, non-commercial use; current terms and quotas apply) for photorealistic 3D and world terrain; a Google Maps key only for the billing-enabled, metered route and place search; OpenAI when you want to talk to the world. Full map, costs included, in [Keys & Costs](#-api-keys).

<details>
<summary>Older Pinokio versions and credential storage</summary>

Do not enter credentials in Pinokio 8.0.40's native **Configure** panel: that release does not save this nested app file correctly, and it logs submitted values. Use **POWER UP → Provider Settings** inside the app instead. The Pinokio 8.2 announcement fixes installation; it does not establish that this separate Configure issue is resolved. On macOS, the Keychain via `./scripts/dev-fresh.sh` remains the stronger storage option.

</details>

The server binds to **localhost** on every path, and Provider Settings answers requests only from your machine. Browser-side keys (Google Maps, Cesium ion) must be restricted at their providers — [SECURITY.md](SECURITY.md) shows how, and it carries the LAN-sharing rules alongside [Keys & Costs](#-api-keys).

---

## 🌍 GEO — The Live Globe

The Geo tab is the surface inherited from God's Eye View, and it is the most finished thing in the project. **`LIVE`**

### What it does today

- **🛩️ Cockpit view:** Ride inside a tracked flight — the camera holds the terrain under you all the way down.
- **📡 Contacts:** A 250 km roster of everything near your target — step through live aircraft and drop into any cockpit.
- **🎯 Click-to-track anything:** Camera locks on, draws a fading trail, surfaces full metadata — and a tracked fire or vessel hands you off to the nearest live camera in one click.
- **🖊️ Voice whiteboard:** Speak annotations onto the world — real boundary polygons, marks, and routes.
- **🛫 3D hangar:** Real per-class aircraft models — 787, ATR-72, Citation, Bell 206, MQ-9 — and a tracked contact swaps from glyph to 3D model as you close in.
- **🎨 Reskin reality:** GLSL sensor looks over the normal globe — CRT, NVG, FLIR/thermal, Noir, Snow.
- **🟩 Detection overlay:** Screen-space bounding boxes and IDs on everything in view.
- **🎖️ Military HUD:** Tactical heads-up display with intelligence-style telemetry.
- **🌐 Global Context:** Stage the full situational picture with one switch — and get your exact view back when you leave.
- **🎥 Scene director:** Capture cinematic camera tours for clips and demos.
- **🔗 Share Links:** Camera, style, layers, and even one tracked target serialize into a URL — a live target is a handoff, not a bookmark.
- **🏠 Reset Globe:** One control, or one sentence, back to the full Earth.

**Keyboard:** `1`–`7` visual styles · `H` HUD · `D` detection · `C` cockpit · `Esc` out.

### Data on the globe

Thirteen layers and map sources. **Eleven have a keyless path.** Some offer additional capabilities with a provider key. (🟢 no key · 🟡 free key · 🔴 metered.)

| Layer | What you get | Source | Auth |
|-------|--------------|--------|------|
| 🗺️ **Map Stack** | Esri satellite imagery, Google Photorealistic 3D, OSM, plus additional ion-hosted stacks | Esri / Google / Ion / OSM | 🟢 Esri satellite + OSM · 🟡 ion-hosted Google 3D + world terrain · 🔴 direct Google + place search |
| ✈️ **Live Flights** | 11,000+ live aircraft + route history | OpenSky + adsb.lol | 🟢 (🟡 optional for more polling credits) |
| 🎖️ **Military Flights** | ADS-B military traffic in amber | adsb.lol | 🟢 |
| 🚢 **Live Vessels** | Thousands of ships worldwide | AISStream | 🟡 |
| 🛰️ **Satellites** | 838-object catalog, color-coded by class with a live legend — the **DENSE** chip drops in the whole Starlink shell | CelesTrak | 🟢 |
| 🌍 **Earthquakes** | Global seismic activity, last 24h | USGS | 🟢 |
| 🚗 **Traffic** | Simulated vehicles on OSM roads. With TomTom, live flow speeds drive the simulation and congestion colors below ~8 km; individual vehicle positions are not live observations | TomTom + OSM | 🟢 simulation · 🟡 live flow speeds |
| 📹 **CCTV Mesh** | ~800 public cameras projected *into* the 3D space — Austin · California (Caltrans) · London (TfL). Positions are published; poses are estimated priors **you calibrate by dragging a gizmo on the camera itself** | City APIs | 🟢 |
| 📻 **Radio** | Geolocated world radio with an **analog tuner** — drag the needle across up to 750 stations and the globe flies to each broadcaster | Radio Browser / broadcasters | 🟢 |
| 🚲 **Bikeshare** | Live station availability | GBFS | 🟢 |
| 🔥 **Active Fires** | Live NASA FIRMS detections, trailing 24h | NASA FIRMS | 🟡 |
| 🚀 **Space Missions** | Rolling 30-day launches with payload, stage, and recovery detail | Launch Library 2 | 🟢 (🟡 optional token raises the allowance) |
| 🎖️ **Mapped Installations** | Viewport-bounded military-site context from community mapping — incomplete by nature, and labeled that way | OpenStreetMap | 🟢 |

**The basemap ladder — what each tier buys you:**

| You have | The globe you get |
|---|---|
| 🟢 Nothing | Esri World Imagery satellite basemap + keyless terrain, in 2D. OSM takes over automatically if Esri is unreachable; if terrain is unavailable the globe continues without it |
| 🟡 A free Cesium ion token | **Google Photorealistic 3D cities** and world terrain — eligible personal, non-commercial use; current ion terms and quotas apply |
| 🔴 A Google Maps key | The same 3D direct from Google, plus in-app place search — the billing-enabled, metered route |

**Also on the globe:** neighborhood overlays and an optional cockpit WX cloud effect. **Bundled static infrastructure:** Datacenters (4,351), Dams (704), and Submarine Cables (712).

Most feeds are live or regularly refreshed. Traffic is simulated along real roads using aggregate location data. CCTV camera poses and rocket launch trajectories are coarse estimates. Every layer is a separate module — start with the included sources, then add your own.

### 🎙️ Talk to it

> Voice needs an **OpenAI key**. Without one the entire app still runs — the mic button just reports voice is unavailable. The same key drives the **AI HUD summary**: a terse, five-word intelligence-style readout of the current view that regenerates as you move.

Click the **MIC** chip, grant the microphone, and just talk. This is more than a voice-controlled remote:

- **🧠 It knows what it's looking at.** The agent pulls live scene context before answering — coordinates, street names, active layers, view scale. Ask *"what city is this?"* mid-flight and it knows.
- **🎯 Entity Q&A.** Click any plane, ship, or datacenter and ask *"what's this?"* It answers using the object's live telemetry.
- **👁️ Visual grounding.** At street level it reads a viewport screenshot to identify legible signage and building names, and is instructed never to hallucinate labels.
- **🎬 Cinematic framing.** *"Show me the planes overhead"* pulls the camera back, angles it, and frames the live traffic like a director.
- **🔒 Honest and secure.** The agent only confirms actions that actually succeeded. Your `OPENAI_API_KEY` never touches the browser; the client only gets a short-lived session token.

Twenty-eight tools, four jobs:

**🎥 Direct it** — drone-operator camera verbs:
> 🗣️ *"Take me to Tokyo."* · *"Orbit around this area slowly."* · *"Draw the walking route from the Capitol to Zilker Park."* → *"Fly the route we just drew."* · *"Zoom out to a globe view."*

**🖊️ Annotate it** — a whiteboard over the real world:
> 🗣️ *"Outline the state of Texas."* · *"Annotate the Texas State Capitol and its grounds"* — it draws the **actual enclosing boundary**, not a circle. · *"How far is the Eiffel Tower from the Louvre?"* — a connector arrow appears and it speaks the distance. Everything persists until you say *"clear the map."*

**🔎 Interrogate it** — analyst queries against the live layers:
> 🗣️ *"How many flights are over Texas right now?"* · *"Which ships are headed to Oakland?"* · *"What is the biggest fire near Los Angeles?"* · *"Is anything flying above forty thousand feet?"* · *"When does the ISS pass over next?"*

**🎛️ Operate it** — the whole console, hands-free:
> 🗣️ *"Switch to night vision and turn on the flights layer."* · *"Turn on the camera viewsheds."* · *"Play a news radio station near Austin."* · *"Track that plane."* → *"Enter Cockpit."* · *"Show me global infrastructure."* · *"Set detection density to fifty percent."* · *"Next contact — helicopters only."* · *"What's turned on right now?"*

### 🎖️ Field missions

Once the basics click, run these:

| Mission | How |
|---|---|
| **🚁 Ask the planet** | *"Why are all these military helicopters flying in circles?"* Select a military track — it silently backfills ~24 h of real trace history — and see what it's been doing, resolved as stacked 3D loops. |
| **✈️ Final approach** | Click-track an airliner lining up for a runway, hop into the **cockpit**, and ride it down. |
| **🌃 Night watch** | Fly to your own city, switch to **NVG**, and let the detection mesh and HUD read the scene. |
| **🚢 Port call** | Vessels on over the Port of Long Beach. Click a tanker for its tactical card and wake trail — then hit **NEAREST** in the CCTV panel and look at the same water through a public camera. |
| **📻 Tokyo FM** | Orbit Shibuya with the **Radio** layer on — then drag the analog tuner needle: every position snaps to a real station and the globe flies to whoever's broadcasting. |
| **🔥 Fire line** | FIRMS over California. Click a detection — the camera dives to it — read the intensity, then hit **NEAREST** in the CCTV panel for a ground view. |
| **🚶 Ask for a walking route** *🎙️* | Tell the world where you want to go and watch a real street-following route trace itself through the 3D city — then *"fly it"*: banked turns, eased ends, a camera that leads the path like a drone shot. |
| **📏 Measure LAX to DFW** *🎙️* | *"How far is LAX from DFW?"* — an arrow spans the country, the distance lands in the caption, and the endpoints stay pinned to the real world as you orbit. |
| **🚀 Launch replay** | Open **Space Missions**, pick a launch from the last 30 days, and ride the T-minus countdown through ascent to orbit — scrub it at 0.25×–4×. Labeled `RECONSTRUCTED ESTIMATE`, because it is one. |
| **🪦 Walk the boneyard** | Fly from regional context down into dense, fully resolved rows of retired aircraft. |
| **🏗️ Orbit Three Gorges** | Sweep the dam and its terrain at a glance — then flip on the **Dams** layer and find 703 more. |

*🎙️ = voice missions — they need an OpenAI key.*

---

## 🏷️ Intelligence Tags & Spotlight

**`DESIGNED`**

A globe covered in everything is a globe showing you nothing. Tags turn the map into a filter.

Every site of intelligence interest gets a **tag**. Select one or more tags and the map enters **Spotlight**: tagged sites brighten, gain labels and halos, and stay legible at range, while everything else — basemap, unrelated layers, ambient contacts — dims to a dark underlay. You keep the geographic context and lose the noise.

### The tag catalogue

Tags resolve from OpenStreetMap keys via the Overpass proxy already wired into this repo, plus curated overrides and the bundled static datasets. The existing **Mapped Installations** layer (which reads `military=*` and `landuse=military`) is the template every other tag follows.

| Tag | Covers | Primary source |
|---|---|---|
| ⚡ **Energy** | Power plants, substations, transmission corridors, refineries, LNG terminals, pipelines | OSM `power=*`, `man_made=pipeline` |
| ☢️ **Nuclear** | Reactors, enrichment and reprocessing sites, waste storage | OSM `power=plant` + `plant:source=nuclear`, IAEA PRIS |
| 🎖️ **Military** | Bases, airfields, ranges, naval facilities, depots | OSM `military=*`, `landuse=military` **`LIVE`** |
| 🏛️ **Government** | Ministries, agencies, legislatures, courts, diplomatic missions | OSM `office=government`, `amenity=courthouse`, `diplomatic=*` |
| 👮 **Policing & Detention** | Police stations, prisons, detention and immigration facilities | OSM `amenity=police`, `amenity=prison` |
| 🖥️ **Digital Infrastructure** | Datacenters, internet exchanges, cable landing stations, ground stations | Bundled datasets **`LIVE`** + OSM `telecom=*` |
| 🚢 **Logistics** | Ports, rail yards, freight terminals, border crossings, warehouses | OSM `landuse=industrial`, `barrier=border_control` |
| 💧 **Water** | Dams, reservoirs, treatment works, flood defences | Bundled Dams dataset **`LIVE`** + OSM `waterway=dam` |
| 🏭 **Industrial & Chemical** | Chemical plants, mines, quarries, heavy manufacturing, tailings | OSM `landuse=quarry`, `industrial=*` |
| 🏥 **Critical Civil** | Hospitals, emergency operations centres, shelters | OSM `amenity=hospital`, `emergency=*` |
| 📡 **Comms & Sensing** | Broadcast towers, radar sites, observatories, SIGINT-adjacent masts | OSM `man_made=mast`/`tower` + `tower:type` |
| 🛑 **Restricted Airspace** | Prohibited, restricted and danger areas; TFRs | Aeronautical open data |
| 🚩 **Flagged by OpenPath** | Sites where the Search pipeline found a removal, a contradiction, or an unexplained change | [Search pipeline](#-search--the-corroboration-engine) |

### How Spotlight behaves

| Control | Effect |
|---|---|
| **Tag select** | Multi-select, AND/OR combinable. Untagged geometry dims; the dim floor is adjustable so you never fully lose orientation. |
| **Density** | Cap how many tagged sites render per viewport, so a dense region stays readable. |
| **Radius** | Restrict to a distance from the camera target, or to a drawn polygon. |
| **Confidence** | Filter by how well-attested a tag is. Community-mapped is not the same as officially published, and the badge says which. |
| **Cross-reference** | Show only tagged sites that also carry a Search flag, or an active community thread. |

**A standing caveat, carried forward from upstream and made louder here:** OpenStreetMap coverage of sensitive sites is *incomplete and uneven by nature*. Absence of a tag is not evidence of absence. Every tagged site shows its provenance, its source, and its last-verified timestamp — and an untagged area shows nothing at all about what may or may not be there.

---

## 💬 SOCIAL — Communities Anchored to Places

**`DESIGNED`**

The Social tab is a community system in the shape people already understand — topic communities with posts, threads, voting and moderators — with one structural difference: **a community can be bound to a geography.**

### Communities

- **Topic communities** work the way you expect: create one, set its rules, appoint moderators, post and discuss. Portable across the whole app.
- **Place-bound communities** are attached to a bounding polygon, a point-with-radius, or an administrative boundary. A city, a port, a border region, a single facility.
- **Entity communities** attach to an object rather than an area: a specific vessel, a tail number, a dam, a datacenter. Follow the object and you follow the conversation about it.

### Geo-anchored live chat

On the Geo tab, chat is a layer. Messages are pinned to real coordinates, and **your feed is a function of where you are looking.**

- Move the camera and the active channel set changes with the viewport. Fly to a port and the port's channels come alive; pull out to the region and you get the region's.
- Your **selected area** — drawn polygon, administrative boundary, or camera viewport — defines your subscription. Pin areas you care about and they keep feeding you when you're looking elsewhere.
- Messages carry the coordinates, altitude and camera state they were sent from, so *"look at this"* is a real handoff — one click and the recipient's camera is where yours was. This extends the Share Links mechanism the globe already has **`LIVE`**.
- Attach a message to a contact, a tagged site, or a Search result, and it becomes an annotation on that object rather than a floating pin.

### What has to be right

A social layer over a map is a soft target, and pretending otherwise would be dishonest. These are requirements, not afterthoughts:

- **Moderation before scale.** Per-community moderators, report queues, rate limits, and a documented escalation path — shipped with the feature, not bolted on after the first incident.
- **Geographic abuse resistance.** Location-pinned content invites brigading of real places and real people. Posting rate limits per area, provenance on every pin, and the ability for a community to require verification before pinning inside its boundary.
- **No location broadcasting.** Where you *look* is not where you *are*. OpenPath pins messages to the coordinates a user chooses to attach, never to device location, and the client does not request geolocation for this feature.
- **Federation is the goal, not an add-on.** The intended long-run shape is an open protocol (ActivityPub is the leading candidate) rather than one instance that owns everyone's communities.

---

## 🔎 SEARCH — The Corroboration Engine

**`DESIGNED`**

Search is where OpenPath stops being a map. Ask about a place, an organisation, a vessel, a facility, or a person, and OpenPath runs a fan-out — then does the work a single search box never does: it compares the answers.

### The pipeline

```
QUERY
  │
  ├─▶ 1. FAN-OUT        parallel scripted queries across every configured source
  │
  ├─▶ 2. NORMALISE      strip trackers, canonicalise URLs, extract text,
  │                     dedupe near-identical results, cluster by document
  │
  ├─▶ 3. RESOLVE        entity resolution — tie hits to a place, org, vessel,
  │                     tail number, or person; geocode what can be geocoded
  │
  ├─▶ 4. TIME-TRAVEL    pull every archived capture of each result; diff the
  │                     captures against each other and against live
  │
  ├─▶ 5. SYNTHESISE     LLM pass: overview, timeline, entity relationships,
  │                     with every claim carrying its source set
  │
  ├─▶ 6. FLAG           second LLM pass, adversarial: find contradictions,
  │                     removals, silent edits, unsourced propagation
  │
  └─▶ 7. PRESENT        overview + evidence table + flag list + map handoff
```

### Sources

**Web indexes** — each has a different crawl, a different ranking, and a different removal regime. Disagreement between them is the entire point.

Google · Bing · Yahoo · Yandex · Brave · DuckDuckGo · Mojeek · Marginalia · Startpage · a self-hosted SearxNG instance as the aggregation fallback

**Archives and memory** — the layer that makes deletions visible.

Internet Archive Wayback Machine (CDX API for full capture history) · archive.today · Common Crawl · Google and Bing cache where still served · Wikipedia revision history · Wikidata

**Social and video** — where a place is discussed before it is written up.

X · Facebook (public pages) · LinkedIn (public company and role pages) · YouTube · Reddit · Mastodon and the wider fediverse · Bluesky · Telegram public channels · TikTok · Instagram (public) · VK · Weibo · GitHub

**Records and registries** — the primary sources that resolve a dispute.

OpenCorporates · SEC EDGAR · Companies House · national business and land registries · court dockets · government tender and procurement portals · sanctions and watch lists (OFAC, EU, UN) · ICIJ Offshore Leaks · OpenSanctions · aviation and vessel registries · NOTAMs · patent and trademark offices · academic and preprint indexes

**Geospatial and observational** — the sources the Geo tab already speaks.

OpenStreetMap change history · Overpass · Sentinel Hub and Landsat open imagery · NASA FIRMS · GDELT event stream · ACLED · plus every live layer already on the globe

> **On the social sources:** most major platforms restrict automated access in their terms of service, and several enforce it technically and legally. OpenPath's connector model treats each source as a pluggable adapter with its own credential, rate limit, and a clearly stated legal posture — official API first, public-and-unauthenticated second, and nothing that requires defeating an access control. Some adapters will therefore be off by default, and some will require you to bring your own API access. See [Scope, Ethics and the Law](#-scope-ethics-and-the-law).

### What gets flagged

The second LLM pass is adversarial by design. It is not asked to summarise; it is asked to find the seams.

| Flag | What triggers it |
|---|---|
| 🗑️ **Removed** | Indexed in a search engine or archived, but 404 / 410 / gone at the live URL |
| ✂️ **Silently edited** | Archived captures differ materially and no correction, changelog, or date stamp acknowledges it |
| ⚔️ **Contradicted** | Two or more sources make claims that cannot both be true — numbers, dates, ownership, status |
| 🪞 **Unsourced propagation** | Many results, one origin. The consensus is an echo of a single unattributed claim |
| 🌍 **Regionally divergent** | The same URL or query returns materially different content by country or by engine |
| 🕳️ **Index gap** | Present in several engines, conspicuously absent from one — including absent from the archives |
| ⏱️ **Timing anomaly** | A cluster of edits, deletions, or registrations tightly grouped around a dated event |
| 🧬 **Entity drift** | A name, owner, or registration changed without a stated reason — shell renames, reflagged vessels, re-registered aircraft |

Every flag opens to its evidence: the captures, the diff, the timestamps, and the sources on each side. **A flag is a prompt to look, not a conclusion.** OpenPath's job is to put the discrepancy in front of you with the receipts attached; deciding what it means is yours.

### Search meets the map

Any search result that resolves to a location can be thrown onto the globe. A query becomes a layer: results as markers, flags as a distinct symbol, the timeline scrubbable. Run the same query against the same place a month later and OpenPath diffs the result sets — which is, in the end, the whole idea.

---

## 🔧 Under the Hood

How the globe handles live data:

- **World-stable icons.** Aircraft and ships point along their *true real-world heading* at every camera angle — tracked or not, looking straight down or across the horizon — via per-frame screen-space course projection. No spinning, no viewport-locking.
- **Smooth motion from choppy data.** Live feeds arrive every 15–30s; the globe renders one interval behind real time and interpolates between known fixes. Dead reckoning fills the gaps.
- **Honest satellites.** SGP4 propagation with orbit rings that stay locked to their satellites via GMST realignment — no drift, no per-second flicker.
- **Sits on the real ground.** Entity heights run through a real vertical datum — geoid-aware, sampled against the *rendered* terrain mesh — so aircraft park on aprons and cameras stand on street corners instead of floating.
- **Caching and request budgets.** An OpenSky credit governor, a TomTom daily tile budget, and disk-cached TLEs reduce repeated requests. These controls do not replace provider quotas or billing controls.
- **Server-side credentials.** Every API that touches a private key (OpenAI, AISStream, OpenSky OAuth, camera frames) is brokered through a hardened server-side proxy with SSRF protection, response caps, and sanitized errors. The only keys the browser sees are Google Maps and Cesium ion (restrict both at the provider).
- **No framework.** Vanilla JavaScript, **CesiumJS**, and **Vite** — plus **Google Photorealistic 3D Tiles** for the planet and the **OpenAI Realtime API** for voice. Fast to read, fast to hack on.

```
src/
├── main.js                 # Bootstrap: Google 3D tiles, layer registration
├── ui.js                   # Runtime UI — panels, HUD, styles, control facade
├── hud.js                  # Intelligence HUD + AI scene summary
├── keySetup.js             # POWER UP panel — in-app provider keys (dev server only)
├── mapStackController.js   # Basemap switching — Google 3D / Esri / OSM / ion stacks
├── voice/                  # OpenAI Realtime session + 28 voice tools
├── data/                   # One module per layer + orchestration + context store
│   ├── iconOrientation.js  # Screen-projected headings + horizon cull
│   ├── militaryInstallations.js  # OSM-tag layer — the template for Intelligence Tags
│   └── local_data/         # Bundled datasets (per-folder provenance)
└── scenes/                 # Cinematic scene director
```

New surfaces will follow the same shape — one module per source, one adapter per connector, no framework:

```
src/
├── tags/        # DESIGNED — tag registry, Overpass queries, Spotlight render pass
├── social/      # DESIGNED — communities, geo-anchored channels, moderation
└── search/      # DESIGNED — source adapters, normaliser, archive differ, LLM passes
```

See [`docs/CURRENT-STATE.md`](docs/CURRENT-STATE.md) for the authoritative runtime reference for what exists today.

---

## 🗺️ Roadmap

| Phase | Work | Status |
|---|---|---|
| **0 — Fork** | Rebrand to OpenPath, attribution, documentation reset | **`BUILDING`** |
| **1 — Tags** | Tag registry, Overpass query set, Spotlight dim/brighten render pass, tag filter UI | **`DESIGNED`** |
| **2 — Search core** | Source adapter interface, fan-out scheduler, normalisation and dedupe, results UI | **`DESIGNED`** |
| **3 — Memory** | Wayback CDX integration, capture diffing, the removal and silent-edit flags | **`DESIGNED`** |
| **4 — Synthesis** | LLM overview pass, adversarial flag pass, evidence and provenance cards | **`DESIGNED`** |
| **5 — Social** | Communities, moderation tooling, posts and threads | **`DESIGNED`** |
| **6 — Geo-anchored chat** | Viewport-driven channels, pinned messages, camera-state handoff | **`DESIGNED`** |
| **7 — Fusion** | Search flags as map markers, entity communities, cross-surface handoff | **`DESIGNED`** |
| **8 — Federation** | Open protocol for communities; multi-instance | **`DESIGNED`** |

Phases are ordered by dependency, not by promise. No dates.

---

## 🔑 API Keys

🟢 **No key** · 🟡 **Free key** · 🔴 **Metered**

Use **POWER UP → Provider Settings** to add keys. The tables below explain what each provider enables; none is required to start. See the [setup instructions](#then-power-it-up--in-the-app-not-in-a-file) for storage and configuration details.

### Choose the capabilities you want

Six keys. Four have a free tier, and the two 🔴 ones are metered:

| | Key | Why | Get it |
|---|-----|-----|--------|
| 🟡 | **Cesium ion** | 🗺️ Google Photorealistic 3D, world terrain, and additional ion-hosted imagery stacks. The free Community plan is for eligible individual, personal/non-commercial use and has quotas | [cesium.com/ion](https://cesium.com/ion) — use a public `assets:read` token and check current [pricing/eligibility](https://cesium.com/platform/cesium-ion/pricing/) |
| 🔴 | **Google Maps** | Direct Google Photorealistic 3D + Google place search ([Map Tiles API](https://developers.google.com/maps/documentation/tile)) | [Google Cloud Console](https://console.cloud.google.com/) — URL-restrict it |
| 🔴 | **OpenAI** | 🎙️ The voice experience + AI HUD summary, and the synthesis passes in Search. The mini model works; the standard model is noticeably smarter. Want Gemini or another provider behind the mic? PRs welcome | [platform.openai.com](https://platform.openai.com) — metered, see costs below |
| 🟡 | **AISStream** | 🚢 Live global ships | [aisstream.io](https://aisstream.io) — free signup |
| 🟡 | **NASA FIRMS** | 🔥 Live active fires | [firms.modaps.eosdis.nasa.gov](https://firms.modaps.eosdis.nasa.gov/api/map_key/) — free |
| 🟡 | **TomTom** | 🚦 Live flow speeds and congestion colors for the simulated traffic layer | [developer.tomtom.com](https://developer.tomtom.com) — free tier available |

### Cherry on top

| | Key | Why | Get it |
|---|-----|-----|--------|
| 🟡 | **OpenSky** | ✈️ More flight-polling credits (🟢 anonymous works without) | [opensky-network.org](https://opensky-network.org) |
| 🟡 | **Launch Library 2** | 🚀 Higher space-missions request allowance (🟢 works without) | [thespacedevs.com](https://thespacedevs.com) |

Add these if you need higher polling allowances.

### Search connectors — **`DESIGNED`**

Search adapters will follow the same model: each is optional, each declares its own key, and the pipeline degrades to whatever you have configured. Expect free-tier or self-hostable options (SearxNG, Wayback CDX, Common Crawl, OpenSanctions, Wikidata) to carry the keyless path, with commercial search APIs as paid upgrades. None of them will be required to run OpenPath.

`npm run doctor` reports Node/npm readiness, the primary provider routes, and where each configured provider was found without printing credential values. On macOS its Keychain-aware result previews `./scripts/dev-fresh.sh`; plain `npm run dev` reads only explicit environment and Vite dotenv values. The OpenSky summary reports only OAuth client-pair presence, not the resolved runtime mode or credential validity; Basic and credentials-file modes remain advanced `dev-fresh.sh` configuration.

<details>
<summary>Advanced setup: environment variables and macOS Keychain</summary>

For headless machines, coding agents, or scripted setups:

```bash
# Put keys in .env (see .env.example), or pass them as env vars:
OPENAI_API_KEY="…" AISSTREAM_API_KEY="…" npm run dev -- --host localhost --port 4173

# On macOS, store any of them in the Keychain and dev-fresh.sh pulls them in:
security add-generic-password -U -s "google-maps-api" -a "api-key" -w
security add-generic-password -U -s "openai-api"      -a "api-key" -w
security add-generic-password -U -s "aisstream-api"   -a "api-key" -w
security add-generic-password -U -s "firms-map"       -a "map-key" -w
security add-generic-password -U -s "cesium-ion"      -a "token"   -w
```

OpenSky can run fully anonymous (`OPENSKY_AUTH_MODE=anon`), or import OAuth credentials with `./scripts/opensky-import-client.sh /path/to/credentials.json`.

</details>

### 💸 What it actually costs

Honest numbers, roughly, as of mid-2026 — always check the provider pricing pages:

| | Cost reality |
|---|---|
| **🟢 Most layers** | **$0, no signup.** OpenSky anon, USGS, CelesTrak, adsb.lol, city CCTV, Radio Browser, GBFS, Launch Library 2, bundled datasets. |
| **🟡 The free-key tier** | **$0 with a signup.** AISStream, FIRMS, TomTom, OpenSky, plus Cesium ion for eligible personal/non-commercial use. Provider quotas and eligibility still apply. |
| **🗺️ Google 3D tiles** | **Free through an eligible Cesium ion Community account within its quota; metered through a direct Google key.** Use the direct route for in-app place search or commercial deployment, verify current provider terms, and set budget alerts where billing is enabled. |
| **🔴 OpenAI voice** | **The one that costs real money — so the app meters it for you.** Realtime audio runs a few cents per active minute; an evening of heavy use is single-digit dollars. A live session-spend readout sits next to the mic, with an STD/MINI model toggle, a $2 warning, and a **$5 hard cap that ends the session**. The voice context window is kept deliberately short too. |
| **🔎 Search synthesis** | **`DESIGNED`** — the LLM passes will be metered and capped the same way voice is. A fan-out with archive diffing is token-hungry; budget controls ship with the feature or the feature does not ship. |

Google's direct 3D route is surprisingly generous: the first 1,000 Photorealistic 3D Tiles sessions each month are currently free, and one root request supports roughly three hours of rendering. A solo user exploring sparingly can realistically stay inside the free usage cap. Billing must still be enabled, so restrict the key and set a quota or budget alert. Check Google's [current pricing](https://developers.google.com/maps/billing-and-pricing/pricing) before relying on these figures.

### 🧗 The floor is low on purpose

Everything above is the deliberately cheap baseline — enough to get a real taste of geospatial intelligence, GEOINT, and OSINT without ever talking to a sales team. You'll also notice the ceiling: terrestrial AIS goes quiet mid-ocean and satellite AIS costs real money; premium imagery, SAR, and the deeper commercial feeds live behind enterprise contracts. That's not a limit of the architecture — every layer here is a pattern you can point at your own data sources. This repo hands you the foundation; what you fuse into it is up to you.

### 🔒 Sharing an instance

By default nobody else can reach your server — it binds to localhost. To share on your LAN, opt in explicitly (`npm run dev -- --host 0.0.0.0 --port 4173`, or `HOST=0.0.0.0 ./scripts/dev-fresh.sh` on macOS/Linux) — but know that ⚠️ **a LAN-visible server brokers your configured API keys to anyone who can reach it.** Set the per-IP throttles (`GEV_RATELIMIT_OPENAI_PER_MIN`, `GEV_RATELIMIT_GOOGLE_PER_MIN` — see `.env.example`) and, before anything else, **configure provider quotas, usage limits, and billing alerts**: app-level throttles are not billing caps, and a budget alert alone does not stop spending. Full threat model in [SECURITY.md](SECURITY.md).

Provider Settings is disabled when the server is shared, so remote users cannot access the key-entry panel.

**Pinokio LAN and Cloudflare sharing remain disabled for this launcher.** Use a separately reviewed authentication proxy if remote access is required. [SECURITY.md](SECURITY.md) explains the restrictions and threat model.

> **Note on the `GEV_` prefix.** Environment variables, internal identifiers, and some UI strings still carry the upstream `GEV` prefix. They are left alone deliberately: renaming them is a breaking change for anyone with an existing `.env`, and it buys nothing but cosmetics. A migration, if it happens, will be a versioned change with a compatibility shim, not a silent rename.

---

## ⚖️ Scope, Ethics and the Law

OpenPath runs on **public data, cited sources, and local-first execution.** No private datasets, no credential-gated scraping, no mystery pipelines — anything involving a private key is brokered server-side.

### Where this fork differs from upstream

Upstream God's Eye View draws an explicit line: it models *events, assets, infrastructure and systems*, and states that it does not build features for named-person search, face recognition, or tracking individuals.

**OpenPath's Search surface does index public material about people.** That is a deliberate divergence, and it is stated plainly here rather than buried, because upstream's position deserves to be represented accurately rather than quietly overwritten. If you want the project that holds that line, [it is still there and still maintained](https://github.com/bilawalsidhu/gods-eye-view) — this is a separate project with a different scope, not a replacement for it.

### What is in scope

Public, published, lawfully accessible material: web pages, archived captures, public social posts, corporate and vessel and aircraft registries, court records, sanctions lists, procurement portals, and academic publications. Where that material concerns a person, OpenPath surfaces it **with its source, its date, and its archive history attached** — the provenance is the product.

### What is out of scope, permanently

These are not roadmap items being deferred. They are excluded:

- **Face recognition, biometric identification, or gait/voice matching.** Not now, not later.
- **Real-time location tracking of an individual**, or any feature whose purpose is to determine where a specific private person is at a given moment.
- **Aggregating a private individual's home address, phone number, workplace, family, or routine into a profile.** Building a dossier on a non-public person is the thing this explicitly does not do.
- **Anything behind an access control.** No credential stuffing, no defeating authentication, no bypassing rate limits or bot detection, no accessing private accounts, groups, or messages.
- **Harassment infrastructure.** No brigading tools, no pile-on coordination, no target lists.

Pull requests implementing any of the above will be rejected.

### Legal reality, stated plainly

This is not legal advice, and nothing in the MIT license insulates you from any of it. If you run OpenPath, these are yours to handle:

- **Data protection law.** GDPR and UK GDPR treat indexing, storing and profiling personal data as processing, regardless of whether the source was public. If you host an instance for anyone but yourself, you are likely a controller with lawful-basis, transparency, retention, and erasure obligations. CCPA/CPRA, LGPD, PIPEDA and others impose their own. Running locally for personal research sits differently from operating a service — but *differently* is not *exempt*.
- **Platform terms of service.** Most large platforms prohibit automated collection. LinkedIn, Meta and X have all enforced this, in court and technically. `hiQ v. LinkedIn` narrowed the CFAA's reach over public scraping in the US; it did not make breach of contract or the equivalent claims elsewhere disappear, and it has no authority outside the US. Use official APIs where they exist.
- **Copyright and database rights.** Retrieving and quoting is not the same as republishing. The EU sui generis database right in particular has no US analogue and catches bulk extraction.
- **`robots.txt` and rate limits.** OpenPath's adapters respect `robots.txt` and back off on rate limits by default. Turning that off is a configuration you make knowingly, and it is on you.
- **Defamation and accuracy.** A flag raised by an LLM is a hypothesis with evidence attached, not a finding of fact. Publishing an automated inference about a named person as though it were established is how people get sued, and rightly.

**Jurisdiction matters enormously here, and this project cannot tell you what applies to you. If you plan to host OpenPath for other people, or to use it professionally, get advice from someone qualified in your jurisdiction first.**

### Status

An evolving open-source client for exploration, research, and learning — a fast, hackable foundation, not a hardened production service. Released under the **[MIT License](LICENSE)**. Bundled and live datasets carry their own terms — see **[DATA_SOURCES.md](DATA_SOURCES.md)**. Security model: **[SECURITY.md](SECURITY.md)**. Want to contribute? **[CONTRIBUTING.md](CONTRIBUTING.md)**.

> [!IMPORTANT]
> OpenPath is an exploratory visualization and aggregation of public and third-party data.
> Data may be delayed, incomplete, modeled, inferred, or wrong, and LLM-generated
> overviews and flags may be wrong in ways that read as confident. Do not use it
> for flight or maritime navigation, emergency response, medical or health
> decisions, investment decisions, hiring or credit decisions, or other
> safety-critical or operational purposes. Verify important information with
> authoritative sources before acting on it or repeating it.

---

## 🙏 Acknowledgements

**OpenPath is a fork of [God's Eye View](https://github.com/bilawalsidhu/gods-eye-view).** Essentially all of the code that renders the globe today — the live data layers, the cockpit, the voice agent, the sensor styles, the detection mesh, the security model, the key-handling panel — was written by its authors, not by this fork.

**Original authors and maintainers:**

- **[Bilawal Sidhu](https://github.com/bilawalsidhu)** — creator of God's Eye View and the [video series](https://youtube.com/playlist?list=PL6qSg2I-7_koPbDnSMo0QeeHX_RknA2uv) that started it
- **[Sameh Khamis](https://github.com/samehkhamis)** — maintainer
- Both at **[Halfpixel](https://halfpixel.ai)**, who also run the official hosted God's Eye View

God's Eye View is released under the **[MIT License](LICENSE)**, Copyright © 2026 Bilawal Sidhu. That license is retained in full in this repository, unmodified, and it is what makes this fork possible. **OpenPath is an independent, unaffiliated project.** It is not endorsed by, supported by, or connected to Bilawal Sidhu, Sameh Khamis, or Halfpixel, and any bugs, opinions, or scope decisions you find here are this fork's, not theirs. Please do not take problems with OpenPath to the upstream issue tracker.

If this project is useful to you, the upstream one is where the foundation came from — **[star it](https://github.com/bilawalsidhu/gods-eye-view)**, watch the series, and consider contributing there too.

### Also standing on

**CesiumJS** and **Cesium ion** · **Google Photorealistic 3D Tiles** · **OpenStreetMap** contributors and the **Overpass API** · **OpenSky Network** · **adsb.lol** · **AISStream** · **CelesTrak** and **satellite.js** · **USGS** · **NASA FIRMS** · **TomTom** · **Radio Browser** · **GBFS** publishers · **The Space Devs / Launch Library 2** · **City of Austin**, **Caltrans**, and **Transport for London** open camera data · **TeleGeography** · **Esri** · **Vite** · the **Internet Archive**, without whom the memory half of this project would not be possible

Bundled datasets and live feeds are **not** covered by the MIT license and carry their own terms — several are explicitly non-commercial or share-alike. **[DATA_SOURCES.md](DATA_SOURCES.md)** has the full per-source license and attribution summary, and [`public/models/README.md`](public/models/README.md) covers the 3D models. Read both before you deploy anything.

---

<div align="center">

**🧭 OpenPath — Connecting the dots.**

*Built on [God's Eye View](https://github.com/bilawalsidhu/gods-eye-view). Made of public sources. Open all the way down.*

</div>

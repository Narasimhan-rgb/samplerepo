# Phase 1 Build Plan

## Goal

Build a demonstrable local-video MVP for PPE compliance and restricted-zone monitoring. The target is not to claim full industrial safety automation. The target is one reliable demo path:

```text
Short video → PPE detection → zone rule → violation event → dashboard entry
```

## Week 1: Setup and proof of flow

- Create `backend/` and `frontend/` applications.
- Verify a local video can be uploaded and read frame by frame.
- Define the minimum custom model labels: `person`, `helmet`, `vest`.
- Create one test scenario: worker in a marked zone without a helmet.

## Week 2: Custom PPE model

- Select a legally usable PPE dataset.
- Train or obtain an authorised custom object-detection model.
- Measure basic precision, recall and false-alert examples on held-out test clips.
- Do not claim production accuracy before testing.

## Weeks 3–4: Safety rules and data

- Add a configurable rectangular zone.
- Check whether each detected worker inside the zone has required PPE.
- Log timestamp, missing PPE, severity and event screenshot.
- Save only event evidence, not continuous raw footage.

## Weeks 5–6: Dashboard and report

- Add a dashboard with event count, high-risk events and event history.
- Add downloadable daily/weekly report.
- Add one alert method: email, Telegram or local notification.

## Weeks 7–8: Demo validation

- Test with at least five short clips across lighting and camera-angle conditions.
- Record alert latency and false-positive cases.
- Prepare a two-minute demo video.
- Interview at least three potential MSME users about the report and alerts.

## Success criteria

| Area | Minimum evidence |
|---|---|
| Computer vision | Detect person, helmet and vest from a test clip |
| Rule engine | Log missing-PPE event when a worker enters the configured zone |
| Privacy | Store only event screenshot/clip, not complete video archive |
| Dashboard | Show timestamped event history and severity |
| Customer insight | Three documented conversations with possible users |

## Risks to control

- A generic person-detection model is not sufficient; use a custom PPE model.
- Do not test with real employee footage without permission.
- Do not promise near-miss detection or 99% accuracy without validation.
- Keep model licences, data permissions and workplace privacy in mind.

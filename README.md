# SafeAudit AI

> Privacy-aware edge-AI safety compliance monitoring for small manufacturing units.

SafeAudit AI is a solo Phase 1 product prototype designed for MSME workshops that already use CCTV cameras. It turns local video into actionable PPE-compliance events, restricted-zone alerts, supervisor reviews, and simple safety reports without relying on continuous cloud video storage.

## Product status

SafeAudit AI is ready for dashboard demo and local pilot preparation.

| Capability | Status |
|---|---|
| Local dashboard | Complete |
| Demo safety events | Complete |
| Safety-zone configuration | Complete |
| Supervisor review workflow | Complete |
| CSV event report | Complete |
| Review-based evaluation summary | Complete |
| Windows demo launcher | Complete |
| Windows unit-test launcher | Complete |
| PPE model compatibility checker | Complete |
| Real PPE video analysis | Requires an authorised custom `.pt` model |
| Real pilot result | Requires one authorised test video and manual review |

## Phase 1 MVP

The initial prototype validates:

- Helmet and safety-vest compliance from a local video feed
- One configurable restricted or high-risk zone
- Timestamped violation logs with event screenshots
- Local event database and simple dashboard
- Supervisor verdicts: confirmed violation, false alarm, unclear
- Review-based evaluation metrics that exclude demo records
- Privacy-aware event-only storage

## Why this matters

Small factories often record CCTV footage but review it only after an incident. SafeAudit AI aims to make existing cameras more useful by helping supervisors identify safety risks earlier, at lower cost.

## Technical direction

```text
Existing CCTV / test video
        ↓
Custom PPE object-detection model
        ↓
Zone and rule engine
        ↓
Violation event log
        ↓
Dashboard, review, report and alerts
```

Stack: Python, FastAPI, SQLite/PostgreSQL-ready storage, React, OpenCV, a custom PPE model, and local edge deployment.

## Windows quick start: dashboard demo

Install Python 3.11+ and Node.js LTS once. Then open Command Prompt in the repository folder and run:

```cmd
git pull origin main
run-demo.cmd
```

The launcher creates the Python environment, installs local packages, creates clearly labelled demo records, starts the FastAPI backend and React frontend in separate windows, and opens:

```text
http://localhost:5173
```

Keep both service windows open while using the dashboard. This mode uses only local demo events; it does not claim real PPE detection.

## Verify the backend

After the demo has been launched once, run:

```cmd
run-tests.cmd
```

All backend unit tests should pass before using the project for a demo or pilot.

## Run modes

### Dashboard demo mode

Set this in `backend/.env` to test the dashboard, reviews, metrics, and CSV export without any model or video:

```text
MODEL_PATH=
DEMO_MODE=true
```

### Real PPE video pilot mode

A custom local YOLO-compatible model is required. The model must recognise canonical classes:

```text
person
helmet
vest
```

Common names such as `Worker`, `Hardhat`, and `Safety Vest` are normalised automatically. Validate the model from the repository root:

```cmd
check-ppe-model.cmd "D:\path\to\ppe-model.pt"
```

If the checker reports `READY`, update `backend/.env`:

```text
MODEL_PATH=D:\absolute\path\to\ppe-model.pt
DEMO_MODE=false
```

Then start local pilot mode:

```cmd
start-pilot.cmd
```

Read `backend/models/README.md` and `docs/PILOT_START.md` before adding any model. Do not commit model weights.

## Product evidence to collect

For an MSME or MS portfolio demo, collect:

1. Dashboard screenshot in demo mode.
2. Backend test output showing all tests passed.
3. Model checker output showing `READY` when a PPE model is available.
4. One authorised test-video run.
5. Supervisor review results for every generated event.
6. Downloaded CSV event report.
7. Pilot notes using `docs/PILOT_VALIDATION_FORM.md`.

## Honest scope

This is a Phase 1 product prototype. It does not claim validated near-miss prediction, multi-camera tracking, industrial-grade face anonymisation, production safety certification, or legal compliance certification until those capabilities are tested in a real pilot.

## Build roadmap

| Phase | Output |
|---|---|
| 1 | Dashboard demo, zones, events, review, CSV report, tests |
| 2 | Custom PPE model validation and one authorised local video pilot |
| 3 | Pilot report, feedback loop, threshold tuning, false-alarm reduction |
| 4 | Edge-device benchmark, privacy improvements, user accounts, deployment hardening |

## Repository rules

Never commit raw CCTV recordings, personal data, incident images from real workplaces, model weights without permission, `.env` files, or API keys.

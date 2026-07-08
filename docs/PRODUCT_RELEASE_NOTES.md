# SafeAudit AI — Phase 1 Product Release Notes

## Release type

Local Phase 1 product prototype for dashboard demo and authorised pilot preparation.

## What is complete

- React dashboard for safety-event review
- FastAPI backend with local SQLite storage
- Safety-zone creation
- Event listing and metrics
- Supervisor review workflow
- CSV event report export
- Review-based evaluation summary
- Demo-mode seeding with clearly labelled sample events
- Windows demo launcher: `run-demo.cmd`
- Windows test launcher: `run-tests.cmd`
- PPE model checker: `check-ppe-model.cmd`
- Pilot launcher: `start-pilot.cmd`
- Pilot checklist and evaluation protocol documentation

## What is deliberately not claimed yet

- Validated industrial safety certification
- Near-miss prediction
- Multi-camera tracking
- Automatic attendance or identity recognition
- Production-grade alerting
- Legal compliance certification
- Model accuracy without manual ground truth

## Product-ready demo script

1. Run `run-demo.cmd`.
2. Open the dashboard at `http://localhost:5173`.
3. Show configured zone and demo events.
4. Mark event reviews as confirmed violation, false alarm, or unclear.
5. Show metrics update.
6. Download the CSV report.
7. Explain that real-video mode needs a verified custom PPE model.

## Pilot-ready checklist

Before a real workshop test:

- Get written permission to process the video.
- Use a short test clip, not continuous raw CCTV storage.
- Validate the `.pt` model with `check-ppe-model.cmd`.
- Configure `MODEL_PATH` and `DEMO_MODE=false`.
- Create one safety zone.
- Review every generated event manually.
- Record pilot results in `docs/PILOT_VALIDATION_FORM.md`.

## Current product status

SafeAudit AI is complete as a Phase 1 software prototype. Real product validation requires a custom PPE model and one authorised pilot video.

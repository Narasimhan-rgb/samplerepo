# SafeAudit AI backend

FastAPI backend for the Phase 1 local MVP.

## What it does

- Creates safety zones with rectangle coordinates.
- Stores reviewable safety events in SQLite.
- Exports event metadata as CSV.
- Checks local MVP readiness before analysis.
- Provides clearly labelled local demo records for dashboard walkthroughs.
- Analyses authorised short videos only after an authorised PPE model is configured.

## Local setup on Windows

```powershell
cd backend
py -m venv .venv
.\.venv\Scripts\activate
pip install -r requirements.txt
copy .env.example .env
uvicorn app.main:app --reload --port 8000
```

Open API documentation at `http://127.0.0.1:8000/docs`.

## First-run demo without a PPE model

The dashboard can be demonstrated before model integration using local sample records.

1. Keep this in `backend/.env`:

```text
DEMO_MODE=true
```

2. With the virtual environment active, seed local sample data:

```powershell
python -m app.seed_demo
```

3. Start the frontend and open the dashboard. You will see a demo safety zone and two events explicitly marked `DEMO ONLY`.

4. Mark one event as **Confirmed violation**, **False alarm**, or **Unclear** to test the review workflow and CSV report.

Demo records do not come from a camera, AI model, or video analysis. They are only for verifying the local UI and database flow.

## Before video analysis

1. Install vision packages:

```powershell
pip install -r requirements-vision.txt
```

2. In `backend/.env`, set an authorised local model path:

```text
MODEL_PATH=C:\path\to\ppe-model.pt
```

3. The model must contain these labels exactly:

```text
person
helmet
vest
```

4. Open `GET /api/v1/readiness`. Resolve every blocker before uploading a test video.

## Test command

```powershell
$env:PYTHONPATH = "."
python -m unittest discover -s tests -v
```

## Data handling

- Raw uploads are deleted after the synchronous MVP analysis completes.
- Event evidence images and SQLite data remain local.
- Never use real workplace footage without permission.

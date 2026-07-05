# Run SafeAudit AI locally

## 1. Backend

```powershell
cd backend
py -m venv .venv
.\.venv\Scripts\activate
pip install -r requirements.txt
copy .env.example .env
uvicorn app.main:app --reload --port 8000
```

Open `http://127.0.0.1:8000/docs` to test the API.

Create one dashboard test event with the `POST /api/v1/events` endpoint:

```json
{
  "event_type": "ppe_non_compliance",
  "severity": "high",
  "message": "Helmet missing inside configured safety zone.",
  "source_name": "demo-video.mp4"
}
```

## 2. Frontend

In another terminal:

```powershell
cd frontend
npm install
npm run dev
```

Open the URL printed by Vite, normally `http://127.0.0.1:5173`.

## Current status

The dashboard and local event APIs are functional scaffolding. Real video inference is deliberately blocked until an authorised PPE model is configured through `MODEL_PATH` in `backend/.env`.

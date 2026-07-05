# PPE Model Setup

Install the optional vision packages:

```powershell
cd backend
pip install -r requirements.txt
pip install -r requirements-vision.txt
```

Create `backend/.env` from `.env.example` and set:

```text
MODEL_PATH=path/to/your/ppe-model.pt
```

The local model must contain exactly these labels:

```text
person
helmet
vest
```

Use a short authorised test clip. The MVP deletes the raw upload after analysis and keeps only generated evidence images for review.

## Current MVP boundaries

- One local video at a time
- One or more rectangular configured zones
- No person tracking
- No multi-camera orchestration
- No safety certification claim
- Review every generated event before acting on it

# SafeAudit AI — Pilot Validation Form

Use this form for one authorised local test video. Do not include personal data or raw CCTV footage in GitHub.

## Test information

| Field | Value |
|---|---|
| Date |  |
| Tester |  |
| Location type | Example: lab / workshop / demo area |
| Camera/video source | Example: phone test video / authorised CCTV clip |
| Video duration |  |
| Video resolution |  |
| PPE model filename |  |
| Model checker result | READY / NOT READY |
| Safety zone name |  |
| Required PPE | Helmet, vest |

## Manual ground truth

| Frame/time range | Expected condition | Notes |
|---|---|---|
|  | Worker wearing helmet and vest |  |
|  | Helmet missing |  |
|  | Vest missing |  |
|  | Worker outside zone |  |

## Generated events

| Event ID | Time | System message | Supervisor verdict | Evidence reviewed? | Notes |
|---|---|---|---|---|---|
|  |  |  | Confirmed violation / False alarm / Unclear | Yes / No |  |

## Metrics

| Metric | Value |
|---|---|
| Real events generated |  |
| Reviewed real events |  |
| Confirmed violations |  |
| False alarms |  |
| Unclear events |  |
| Review rate |  |
| Review-based precision |  |

## Result summary

Write 5–8 lines describing what worked, what failed, and what must be improved before a real MSME pilot.

## Honest conclusion

Use one of these:

- The prototype successfully demonstrated the local PPE event-review workflow on an authorised test video.
- The prototype generated events, but false alarms require model or zone tuning.
- The prototype is not ready for reporting because no reviewed real events were produced.

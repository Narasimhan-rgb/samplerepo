# SafeAudit AI — Controlled Test Metrics Template

Use this template after a short authorised test clip. It documents prototype performance honestly.

## Test run details

| Field | Record |
|---|---|
| Date | |
| Clip identifier | |
| Camera angle | |
| Lighting condition | |
| Zone configuration | |
| Required PPE | Helmet / Vest |
| Clip duration | |
| Frames analysed | |
| Processing time | |

## Event review table

| Event ID | Model severity | Reviewer verdict | Reason or note |
|---:|---|---|---|
| | | Confirmed violation / False alarm / Unclear | |

## Basic calculations

```text
Confirmed event rate = confirmed violations / reviewed events
False alarm rate = false alarms / reviewed events
Review coverage = reviewed events / total generated events
```

These are controlled-test observations from a small sample, not production accuracy metrics.

## Review after each run

- Was the person fully visible?
- Were helmet and vest labels visible at the required resolution?
- Did the selected zone match the work area?
- Did lighting, occlusion or camera angle create an obvious error?
- Was the evidence image useful for a reviewer?
- What should be changed before the next test?

## Reporting language

Use: "In a controlled local test, the Phase 1 prototype generated reviewable PPE-compliance events."

Avoid: "The system is fully accurate", "The system prevents accidents", or "The system is certified for industrial use".

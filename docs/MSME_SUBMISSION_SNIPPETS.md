# SafeAudit AI — MSME Submission Snippets

Use neutral wording in the official portal. Do not include personal identity, college identity, GitHub links, brand names, or research-paper references in anonymous fields.

## Suggested title

Privacy-Aware Edge AI PPE Compliance and Restricted-Zone Monitoring for MSME Workshops

## Theme

Industry 4.0 & 5.0

## 1,500-character concept note

Small MSME workshops often have CCTV cameras but lack affordable real-time safety monitoring. The proposed system converts existing camera feeds into local safety alerts. A compact on-site AI unit detects workers, required PPE such as helmets and vests, and entry into configured high-risk zones. When a rule is violated, the system records a timestamped event and an anonymized evidence image, then shows the event on a local dashboard and can send a metadata-only alert to a supervisor. Core video analysis remains on-site; continuous raw-video storage is avoided. The initial prototype focuses on PPE compliance and restricted-zone monitoring using one camera feed. It is designed as a low-cost retrofit for fabrication, packaging, warehouse, and small manufacturing units, helping supervisors identify repeated risks, reduce manual checking, and improve safety reporting. A later phase may evaluate proximity-based risk alerts after controlled testing and pilot feedback.

## Novelty and usefulness

- Works with existing camera infrastructure instead of requiring a full new safety system.
- Uses local processing and event-only storage to reduce privacy risk.
- Lets supervisors review each event instead of treating AI output as final truth.
- Produces structured safety-event reports for repeated-risk analysis.
- Starts with a narrow, testable Phase 1 scope: PPE and one restricted zone.

## Block diagram text

```text
Existing camera or authorised test video
        ↓
Local AI processing unit
        ↓
PPE and restricted-zone rule engine
        ↓
Timestamped violation event
        ↓
Supervisor dashboard and review
        ↓
CSV/report for safety follow-up
```

## Safe claims

- Phase 1 prototype
- Local PPE compliance monitoring
- Restricted-zone event logging
- Supervisor-reviewed safety events
- Event-only evidence storage

## Avoid claiming now

- Industrial certification
- Near-miss prediction accuracy
- 24/7 production deployment
- Multi-camera tracking
- Face recognition
- Guaranteed accident reduction

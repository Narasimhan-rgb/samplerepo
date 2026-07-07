from __future__ import annotations

from collections.abc import Iterable

from app.models import SafetyEvent, SafetyEventReview

DEMO_SOURCE = "safeaudit-local-demo"


def build_evaluation_summary(
    events: Iterable[SafetyEvent],
    reviews: Iterable[SafetyEventReview],
) -> dict[str, object]:
    """Summarise only real prototype events for an honest Phase 1 report.

    Local walkthrough records created by ``app.seed_demo`` are shown separately and
    are intentionally excluded from validation metrics. This prevents demo clicks
    from being reported as model performance.
    """

    event_list = list(events)
    review_by_event_id = {review.event_id: review for review in reviews}
    real_events = [event for event in event_list if event.source_name != DEMO_SOURCE]
    real_event_ids = {event.id for event in real_events}
    real_reviews = [
        review
        for event_id, review in review_by_event_id.items()
        if event_id in real_event_ids
    ]

    confirmed = sum(review.verdict == "confirmed_violation" for review in real_reviews)
    false_alarms = sum(review.verdict == "false_alarm" for review in real_reviews)
    unclear = sum(review.verdict == "unclear" for review in real_reviews)
    reviewed = len(real_reviews)
    evaluable = confirmed + false_alarms

    return {
        "real_events": len(real_events),
        "demo_events": len(event_list) - len(real_events),
        "reviewed_real_events": reviewed,
        "confirmed_violations": confirmed,
        "false_alarms": false_alarms,
        "unclear_events": unclear,
        "precision": round(confirmed / evaluable, 4) if evaluable else None,
        "review_rate": round(reviewed / len(real_events), 4) if real_events else 0.0,
        "ready_for_reporting": evaluable > 0,
        "note": (
            "Review-based precision excludes demo records and does not measure missed violations. "
            "Use the evaluation protocol's manual ground-truth log before reporting results."
        ),
    }

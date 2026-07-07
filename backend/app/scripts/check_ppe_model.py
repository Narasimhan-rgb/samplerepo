"""Inspect a custom YOLO PPE model before connecting it to SafeAudit AI.

Usage (from backend directory):
    python -m app.scripts.check_ppe_model "D:\\models\\ppe.pt"

This command only reads model metadata. It does not process a video.
"""
from __future__ import annotations

import argparse
import sys
from pathlib import Path

from app.services.ppe_detector import ModelConfigurationError, PPEDetector


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Check whether a custom PPE YOLO model supports SafeAudit AI."
    )
    parser.add_argument("model_path", help="Absolute or relative path to a .pt PPE model")
    args = parser.parse_args()

    path = Path(args.model_path).expanduser()
    if not path.is_file():
        print(f"ERROR: Model file not found: {path}")
        return 1

    try:
        detector = PPEDetector(str(path))
    except ModelConfigurationError as exc:
        print(f"NOT READY: {exc}")
        print("Required canonical labels: person, helmet, vest")
        print("Accepted examples: Hardhat -> helmet; Safety Vest -> vest; Worker -> person")
        return 2

    print("READY: Model is compatible with the SafeAudit AI Phase 1 MVP.")
    print("Canonical class mapping:")
    for class_id, label in sorted(detector.class_names.items()):
        print(f"  {class_id}: {label}")
    print("\nNext steps:")
    print("1. Put the model outside Git tracking (for example backend/models/ppe-model.pt).")
    print("2. Set MODEL_PATH to the absolute model path in backend/.env.")
    print("3. Restart uvicorn and check GET /api/v1/readiness.")
    return 0


if __name__ == "__main__":
    sys.exit(main())

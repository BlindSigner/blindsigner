#!/bin/sh
# BlindSigner: one-shot audio debug test on boot

LOG="/tmp/blindsigner-audio.txt"

echo "=== BlindSigner audio test ===" > "$LOG"
date >> "$LOG" 2>/dev/null || true

if command -v aplay >/dev/null 2>&1; then
  echo "" >> "$LOG"
  echo "[aplay -l]" >> "$LOG"
  aplay -l >> "$LOG" 2>&1 || true
else
  echo "aplay not found" >> "$LOG"
fi

# Optional: short speaker-test beep (will do nothing if no output device)
if command -v speaker-test >/dev/null 2>&1; then
  echo "" >> "$LOG"
  echo "[speaker-test 1s]" >> "$LOG"
  speaker-test -t sine -f 880 -l 1 -p 200 -P 2 >> "$LOG" 2>&1 || true
else
  echo "speaker-test not found" >> "$LOG"
fi

# Try to show result on console too
if [ -e /dev/console ]; then
  echo "" > /dev/console 2>/dev/null || true
  echo "*** BlindSigner audio test wrote: $LOG ***" > /dev/console 2>/dev/null || true
fi

exit 0

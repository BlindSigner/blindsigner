#!/bin/sh
# BlindSigner: one-shot audio + TTS debug test on boot

LOG="/tmp/blindsigner-audio.txt"

echo "=== BlindSigner audio test ===" > "$LOG"
date >> "$LOG" 2>/dev/null || true

# Show ALSA cards
if command -v aplay >/dev/null 2>&1; then
  echo "" >> "$LOG"
  echo "[aplay -l]" >> "$LOG"
  aplay -l >> "$LOG" 2>&1 || true
else
  echo "aplay not found" >> "$LOG"
fi

# Pick a default card: prefer USB if present
CARD="0"
if [ -f /proc/asound/cards ]; then
  echo "" >> "$LOG"
  echo "[/proc/asound/cards]" >> "$LOG"
  cat /proc/asound/cards >> "$LOG" 2>&1 || true

  if grep -qi "usb" /proc/asound/cards; then
    # take first card number line that mentions USB
    CARD="$(awk 'tolower($0) ~ /usb/ {print $1; exit}' /proc/asound/cards)"
  fi
fi

echo "" >> "$LOG"
echo "Selected ALSA card: $CARD" >> "$LOG"

# Optional: short speaker-test beep (best effort)
if command -v speaker-test >/dev/null 2>&1; then
  echo "" >> "$LOG"
  echo "[speaker-test 1s on hw:$CARD,0]" >> "$LOG"
  speaker-test -D "hw:${CARD},0" -t sine -f 880 -l 1 -p 200 -P 2 >> "$LOG" 2>&1 || true
fi

# Text-to-speech test (best effort)
if command -v espeak-ng >/dev/null 2>&1; then
  echo "" >> "$LOG"
  echo "[espeak-ng test]" >> "$LOG"
  # Speak through ALSA if possible; fall back to default
  espeak-ng -v en "BlindSigner booted" >> "$LOG" 2>&1 || true
else
  echo "" >> "$LOG"
  echo "espeak-ng not found" >> "$LOG"
fi

# Console hint
if [ -e /dev/console ]; then
  echo "" > /dev/console 2>/dev/null || true
  echo "*** BlindSigner audio test done. Log: $LOG ***" > /dev/console 2>/dev/null || true
fi

exit 0

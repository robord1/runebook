#!/bin/bash

LOG="$HOME/bisync.log"
SRC="$HOME/Desktop"
DEST="dcrypt:main"

echo "[$(date)] Starting bisync" >> "$LOG"
/usr/bin/rclone bisync "$SRC" "$DEST" >> "$LOG" 2>&1

#!/usr/bin/bash
INTERVAL=1
LOGFILE="monitor.log"

while true; do
    echo "current date-time" >> "$LOGFILE"
    free -h >> "$LOGFILE"
    df -h >> "$LOGFILE"
    uptime >> "$LOGFILE"
    echo "" >> "$LOGFILE"
    sleep "$INTERVAL"
done

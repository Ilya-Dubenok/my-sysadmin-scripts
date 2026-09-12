#!/usr/bin/bash
INTERVAL=1
LOGFILE="monitor.log"

new_line() {
    echo "" >> "$LOGFILE"
}

while true; do
    echo "---$(date '+%Y-%m-%d %H:%M:%S')---" >> "$LOGFILE"
    new_line
    free -h >> "$LOGFILE"
    new_line
    df -h >> "$LOGFILE"
    new_line
    uptime >> "$LOGFILE"
    new_line
    sleep "$INTERVAL"
done

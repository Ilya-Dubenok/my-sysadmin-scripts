#!/usr/bin/env bash
INTERVAL=1
LOGFILE="monitor.log"

new_line() {
    echo "" >> "$LOGFILE"
}

if [ "$1" = "-b" ]; then
    nohup "$0" >/dev/null 2>&1 &
    disown
    echo "Run in background, PID: $!"
    exit 0
elif [ -n "$1" ]; then
    echo "error: unexpected argument '$1'" >&2
    exit 1
fi

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

#!/bin/sh
PIDFILE="/tmp/dwm-record.pid"

if [ -f "$PIDFILE" ]; then
    kill -INT "$(cat "$PIDFILE")"
    rm -f "$PIDFILE"
else
    GEOM=$(slop -f "%wx%h+%x+%y")
    W=$(echo "$GEOM" | cut -dx -f1)
    H=$(echo "$GEOM" | cut -dx -f2 | cut -d+ -f1)
    X=$(echo "$GEOM" | cut -d+ -f2)
    Y=$(echo "$GEOM" | cut -d+ -f3)
    ffmpeg -f x11grab -video_size "${W}x${H}" -i :0.0+${X},${Y} \
        -f pulse -i default \
        -c:v libx264 -preset ultrafast -c:a aac \
        ~/Pictures/recording-$(date +%s).mp4 &
    echo $! > "$PIDFILE"
fi

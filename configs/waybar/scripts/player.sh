#!/bin/bash

# Wait up to 5 seconds for playerctl to detect players
for i in {1..5}; do
    players=$(playerctl -l 2>/dev/null)
    [ -n "$players" ] && break
    sleep 0
done

# If still no players, return a safe default
if [ -z "$players" ]; then
    echo " No Player"
    exit 0
fi

# Check each player for Playing status
for player in $players; do
    status=$(playerctl -p "$player" status 2>/dev/null)
    
    if [ "$status" = "Playing" ]; then
        # Get all metadata
        artist=$(playerctl -p "$player" metadata artist 2>/dev/null)
        title=$(playerctl -p "$player" metadata title 2>/dev/null)
        album=$(playerctl -p "$player" metadata album 2>/dev/null)
        url=$(playerctl -p "$player" metadata xesam:url 2>/dev/null)
        player_name=$(playerctl -p "$player" metadata mpris:playerName 2>/dev/null)
        
        # Handle radio stations (check if it's a stream URL)
        if echo "$url" | grep -qiE "stream|radio|\.mp3|\.aac|icecast|shoutcast"; then
            # It's a radio stream
            if [ -n "$title" ] && [ "$title" != "Unknown" ]; then
                # Has song title
                echo " ${artist:-Radio} - ${title}"
            elif [ -n "$album" ] && [ "$album" != "Unknown" ]; then
                # Some players put song info in album field
                echo " ${artist:-Radio} - ${album}"
            else
                # Just show station name
                echo " ${artist:-${player_name:-Radio}}"
            fi
        else
            # Regular music player (Sayonara, etc.)
            echo " ${artist:-Unknown} - ${title:-Unknown}"
        fi
        exit 0
    fi
done

# Check for Paused state
for player in $players; do
    status=$(playerctl -p "$player" status 2>/dev/null)
    if [ "$status" = "Paused" ]; then
        echo "⏸ Paused"
        exit 0
    fi
done

# Default fallback
echo " No Music"

#!/bin/bash

SPOTIFY="com.spotify.Client"
DIREC="$HOME/.var/app/$SPOTIFY"

if pgrep -f "$APP" >/dev/null; then
    pkill -f "$APP"
fi

echo "Just Chillin' & Killin' cache/data..."
rm -rf "$DIREC/cache" "$DIREC/data"

echo "Guess who's back... back again... SPOTIFY's Back..."
flatpak run "$SPOTIFY" &


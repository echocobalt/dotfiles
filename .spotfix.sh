#!/bin/bash

SPOTIFY="com.spotify.Client"
DIREC="$HOME/.var/app/$SPOTIFY"

if pgrep -f "$SPOTIFY" >/dev/null; then
    pkill -f "$SPOTIFY"
fi

echo "Just Chillin' & Killin' cache/data..."
rm -rf "$DIREC/cache" "$DIREC/data"

while true; do
    read -p "Launch SPOTIFY? [Y/n] " consent
    if [[ "$consent" == [Nn]* ]]; then
        echo "HASTA LA VISTA... BABY!!!"
        exit 0
    elif [[ "$consent" == [Yy]* || -z "$consent" ]]; then
        echo "Guess who's back... back again... SPOTIFY's Back..."
        flatpak run "$SPOTIFY" &
        break
    fi
done


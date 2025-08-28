#!/bin/bash

APP="com.spotify.Client"
APPDIR="$HOME/.var/app/$APP"

echo "Checkin' $APP..."

if pgrep -f spotify >/dev/null; then
    echo "Killin' SPOTIFY first..."
    pkill -f spotify
    sleep 1
fi

echo "Clearin' cache/storage..."
rm -rf "$APPDIR/cache" "$APPDIR/storage"

echo "Relaunchin' SPOTIFY..."
flatpak run $APP &

#!/bin/bash
CURRENT_DIR=$(dirname "$(readlink -f "$0")")
APK="$CURRENT_DIR/build/VertigoMaze.apk"
WINDOWS="$CURRENT_DIR/build/windows/"

echo Uploading to Itch...
butler -v push "$APK" "malcolmnixon/vertigo-maze:android"
butler -v push "$WINDOWS" "malcolmnixon/vertigo-maze:windows"

echo Done.

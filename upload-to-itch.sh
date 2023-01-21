#!/bin/bash
CURRENT_DIR=$(dirname "$(readlink -f "$0")")
APK="$CURRENT_DIR/build/quest/VertigoMaze.apk"
WINDOWS="$CURRENT_DIR/build/windows/"
WEBXR="$CURRENT_DIR/build/webxr/"

echo Uploading to Itch...
butler -v push "$APK" "malcolmnixon/vertigo-maze:android"
butler -v push "$WINDOWS" "malcolmnixon/vertigo-maze:windows"
butler -v push "$WEBXR" "malcolmnixon/vertigo-maze:webxr"

echo Done.

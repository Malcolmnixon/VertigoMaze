SET CURRENT_DIR=%~dp0
SET APK=%CURRENT_DIR%/build/quest/VertigoMaze.apk
SET WINDOWS=%CURRENT_DIR%/build/windows/
SET WEBXR=%CURRENT_DIR%/build/webxr/

echo Uploading to Itch...
butler -v push "%APK%" "malcolmnixon/vertigo-maze:android"
butler -v push "%WINDOWS%" "malcolmnixon/vertigo-maze:windows"
butler -v push "%WEBXR%" "malcolmnixon/vertigo-maze:webxr"

echo Done.

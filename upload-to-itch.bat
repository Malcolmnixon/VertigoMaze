SET CURRENT_DIR=%~dp0
SET APK=%CURRENT_DIR%/build/VertigoMaze.apk
SET WINDOWS=%CURRENT_DIR%/build/windows/

echo Uploading to Itch...
butler -v push "%APK%" "malcolmnixon/vertigo-maze:android"
butler -v push "%WINDOWS%" "malcolmnixon/vertigo-maze:windows"

echo Done.

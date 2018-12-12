echo 'updating...'

# move the stuff into the correct spot!
if [ -d "$KSP/GameData/DragDetector" ]; then
   rm -rf "$KSP/GameData/DragDetector"
fi
if [ ! -d "$KSP/GameData/DragDetector" ]; then
  mkdir "$KSP/GameData/DragDetector"
  mkdir "$KSP/GameData/DragDetector/Plugins"
  mkdir "$KSP/GameData/DragDetector/Parts"
  cp src/DragDetector/DragDetector/bin/Debug/DragDetector.dll "$KSP/GameData/DragDetector/Plugins/"
  cp -r src/DragDetector/Parts/DragDetector "$KSP/GameData/DragDetector/Parts"
fi

if [ -d "$KSP/GameData/DragLog" ]; then
   rm -rf "$KSP/GameData/DragLog"
fi
if [ ! -d "$KSP/GameData/DragLog" ]; then
  mkdir "$KSP/GameData/DragLog"
  mkdir "$KSP/GameData/DragLog/Plugins"
  mkdir "$KSP/GameData/DragDetector/Parts"
  cp src/DragLog/DragLog/bin/Debug/DragLog.dll "$KSP/GameData/DragLog/Plugins/"
fi

echo 'Done!'
date

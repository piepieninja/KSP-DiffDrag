echo 'updating...'

# move the stuff into the correct spot!
if [ -d "$KSP/GameData/DragDetector" ]; then
   rm -rf "$KSP/GameData/DragDetector"
fi
if [ ! -d "$KSP/GameData/DragDetector" ]; then
  mkdir "$KSP/GameData/DragDetector"
  mkdir "$KSP/GameData/DragDetector/Plugins"
  mkdir "$KSP/GameData/DragDetector/Parts"
  cp src/DragDetector/DragDetector/bin/Debug/netcoreapp2.1/DragDetector.dll "$KSP/GameData/DragDetector/Plugins/"
  cp -r src/DragDetector/Parts/DragDetector "$KSP/GameData/DragDetector/Parts"
fi

echo 'Done!'

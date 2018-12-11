echo 'updating...'

# move the stuff into the correct spot!
if [ -d "$KSP/saves/Overcomplicated" ]; then
   rm -rf "$KSP/saves/Overcomplicated"
fi
if [ ! -d "$KSP/saves/Overcomplicated" ]; then
  cp -r data/Overcomplicated/ "$KSP/saves/Overcomplicated"
fi

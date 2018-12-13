#!/usr/bin/env bash

# the state to load:
state=$1

if [ "$1" != "" ]; then
  echo 'loading Overcomplicated state...'

  # see if there exists a save of this name previously
  # move the stuff into the correct spot!
  if [ -d "$KSP/saves/Overcomplicated" ]; then
     rm -rf "$KSP/saves/Overcomplicated"
  fi
  if [ ! -d "$KSP/saves/Overcomplicated" ]; then
    cp -r data/Overcomplicated/ "$KSP/saves/Overcomplicated"
  fi

  # remove all kos scripts from the KOS dir
  rm "$KSP/Ships/Script/*.ks"
  cp src/kos/*.ks "$KSP/Ships/Script/"

  echo 'done!'
else
  echo 'command arg required'
fi

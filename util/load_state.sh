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

  if [ "$1" == "1" ]; then
    if [ ! -d "$KSP/saves/Overcomplicated" ]; then
      cp -r data/Overcomplicated1/ "$KSP/saves/Overcomplicated"
    fi
  fi
  if [ "$1" == "2" ]; then
    if [ ! -d "$KSP/saves/Overcomplicated" ]; then
      cp -r data/Overcomplicated2/ "$KSP/saves/Overcomplicated"
    fi
  fi

  echo 'done!'
else
  echo 'command arg required'
fi

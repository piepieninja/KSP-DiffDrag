#!/usr/bin/env bash

echo 'loading Overcomplicated state...'

# see if there exists a save of this name previously
# move the stuff into the correct spot!

# remove all kos scripts from the KOS dir
rm "$KSP/Ships/Script/*.ks"
cp src/kos/*.ks "$KSP/Ships/Script/"

echo 'done!'

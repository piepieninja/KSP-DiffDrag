# KSP-DiffDrag
An Attempt Differential Drag in KSP

## Overview

//TODO

## Requirements

#### Makes it work
* Kerbal Space Program
* KOS
* Visual Studio for mac

to run the example load_scripts

* matplotlib
* python 2.7
* numpy

#### Make is better
* Steam
* Atom KOS syntax highlighting

## Running

I must exporting your KSP path to an environment variable `$KSP`

*WARNING* running the `load_state.sh` will replace all of your `Volume.0` KOS
scripts. I'll change this in the future when I get time. this has two possible
arguments, either `1` or `2`. `load_state.sh 1` loads a state with a separation
distance of ~500m and `load_state.sh 2` loads a state with a separation
distance of ~50m.

The `load_scripts.sh` script updates the KOS scripts in KPS

The example scripts are located in `src/examples` and use python 2.7

## Useful Links
* KOS telnet server info: https://ksp-kos.github.io/KOS/general/telnet.html

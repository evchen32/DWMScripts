#!/bin/bash

xmodmap -e "keycode 108 = Super_L"	# Reassigns Alt_R to Super_L
xmodmap -e "remove mod1 = Super_L "	# Make sure X keeps it out of the mod1 group

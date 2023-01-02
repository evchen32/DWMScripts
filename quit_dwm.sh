#!/bin/bash

# This script is to confirm quitting DWM session

# Get Dmenu flag values
source ~/scripts/dmenu_flags.sh

sb_flag='#BF616A'

DMENU="dmenu -fn $fn_flag -nb $nb_flag -nf $nf_flag -sb $sb_flag"
choice=$(echo -e "Are you sure you want to quit this session?\nyes\nno\n" | $DMENU)

case $choice in
    yes)
    	pkill dwm
	;;
    no)
    	;;
    *)
        ;;
esac




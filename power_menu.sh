#!/bin/bash

# Credits to https://bbs.archlinux.org/viewtopic.php?id=95984
# This is a modified version of a dmenu script to open custom menu

# Get Dmenu flag values
source ~/scripts/dmenu_flags.sh

DMENU="dmenu -fn $fn_flag -nb $nb_flag -nf $nf_flag -sb $sb_flag"
choice=$(echo -e "suspend\nlock\n" | $DMENU)

case $choice in
    suspend)
    	i3lock && systemctl suspend	
	;;
    lock)
    	i3lock
	;;
    *)
        ;;
esac


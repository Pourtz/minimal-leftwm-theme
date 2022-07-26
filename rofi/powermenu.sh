#!/bin/sh

rofi_command="rofi -theme ~/.config/leftwm/themes/current/rofi/powermenu.rasi"

#### Options ###
shutdown=""
reboot="勒"
lock=""
suspend="鈴"
logout=""

options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo "$options" | $rofi_command -dmenu -selected-row 0)"
case $chosen in
    $lock)
        ~/.config/leftwm/themes/current/scripts/lockscreen
	    ;;
    $shutdown)
        loginctl poweroff now
        ;;
    $reboot)
        loginctl reboot
        ;;
    $suspend)
	    mpc -q pause
	    amixer set Master mute
        loginctl suspend
        ;;
    $logout)
        loginctl terminate-session ${XDG_SESSION_ID-}
	    ;;
esac


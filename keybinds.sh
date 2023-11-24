set $mod Mod4
set $term foot
set $menu fuzzel
set $browser firefox

floating_modifier $mod

bindsym --to-code {
    $mod+Return exec $term
    $mod+d exec $menu
    $mod+b exec $browser
	
    $mod+q kill
    $mod+Shift+q pkill window
	$mod+Shift+r reload
	$mod+Shift+e exit

	$mod+Escape exec reboot
	$mod+Shift+Escape exec poweroff
	$mod+Shift+s exec loginctl suspend

	$mod+f fullscreen

	$mod+Shift+a move workspace to output left
	$mod+a move window to output left

	$mod+1 workspace 1
	$mod+2 workspace 2
	$mod+3 workspace 3
	$mod+4 workspace 4
	$mod+5 workspace 5
	$mod+6 workspace 6

	$mod+Shift+1 move window to workspace 1; workspace 1
	$mod+Shift+2 move window to workspace 2; workspace 2
	$mod+Shift+3 move window to workspace 3; workspace 3
	$mod+Shift+4 move window to workspace 4; workspace 4
	$mod+Shift+5 move window to workspace 5; workspace 5
	$mod+Shift+6 move window to workspace 6; workspace 6

	$mod+Shift+space floating toggle

#	$mod+Tab exec swaymsg input type:keyboard xkb_switch_layout next
}

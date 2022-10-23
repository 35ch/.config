set $mod Mod4
set $term kitty
set $menu wofi -c ~/.config/wofi/config -s ~/.config/wofi/style.css

floating_modifier $mod

assign [class="Firefox"] 1
assign [class="Steam"] 2

bindsym --to-code {
    $mod+Return exec $term
    $mod+d exec $menu

    $mod+q kill
    $mod+Shift+c reload
    $mod+Shift+e exit
    
    $mod+Escape exec reboot
    $mod+Shift+Escape exec poweroff
    
    $mod+f fullscreen
    
    $mod+Left focus left
    $mod+Down focus down
    $mod+Up focus up
    $mod+Right focus right
    
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
}

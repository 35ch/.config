set $t      #00000000
set $bg     #363739
set $fg     #babcbf
set $lbg    #454649
set $red    #c15a5a
set $blu    #5893b6

font pango:Cozette bold 11

default_border pixel 6

# class                 border  background text    indicator
client.focused          $t      $t         $t      $t
client.focused_inactive $t      $t         $t      $t
client.unfocused        $t      $t         $t      $t
client.urgent           $t      $t         $t      $t

output * bg $wallpaper fill

bar {
    position top
    
    colors {               
	statusline         $fg
	background         $bg

#                          border    background text	
	active_workspace   $bg       $bg        $fg
	focused_workspace  $bg       $bg        $blu
	urgent_workspace   $red      $red       $red
	inactive_workspace $bg       $bg        $fg
	}
																	  
    status_command while ~/.config/sway/swaybar.sh; do sleep 1; done
}

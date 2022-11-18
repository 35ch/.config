set $wallpaper ~/wallpapers/macross.jpg

set $t      #00000000
set $bg     #363739cc
set $fg     #babcbf
set $lbg    #454649
set $red    #c15a5a
set $blu    #5893b6

font pango:cozette bold 11

default_border none

# class                 border  background text    indicator
client.focused          $t      $blu       $blu    $blu 
client.focused_inactive $t      $lbg       $lbg    $lbg  
client.unfocused        $t      $bg        $bg     $bg  
client.urgent           $t      $red       $red    $red  

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
	inactive_workspace $bg       $bg        $lbg
	}
																	  
    status_command while ~/.config/sway/swaybar.sh; do sleep 1; done
}

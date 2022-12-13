set $t      #00000000
set $bg     #363739
set $fg     #babcbf
set $red    #ca5a5a

font pango:Cozette 11

default_border pixel 6

# class                 border  background text    indicator
client.focused          $t      $t         $t      $t 
client.focused_inactive $t      $t         $t      $t  
client.unfocused        $t      $t         $t      $t  
client.urgent           $t      $t         $t      $t  


bar {
	position top
    
	gaps 6

	colors {               
		statusline         $fg
		background         $bg

#                          border    background text	
		active_workspace   $bg       $bg        $t
		focused_workspace  $bg       $bg        $fg
		urgent_workspace   $red      $red       $red
		inactive_workspace $bg       $bg        $t
		}
	
		status_command while ~/.config/sway/swaybar.sh; do sleep 1; done
}

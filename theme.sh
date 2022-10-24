set $wallpaper ~/Downloads/bg.png
set $t #00000000

font pango:Unifont 12

default_border pixel 4

# class                 border background text indicator
client.focused          $t     $t         $t   $t        
client.focused_inactive $t     $t         $t   $t         
client.unfocused        $t     $t         $t   $t       
client.urgent           $t     $t         $t   $t      
client.placeholder      $t     $t         $t   $t       
client.background       $t     $t         $t   $t        

output * bg $wallpaper fill

bar {
    position top
	  gaps 4

	  colors {               
	      statusline         $t
		    background         #303438

#                          border  background text	
		    active_workspace   $t      $t         #303438
		    focused_workspace  $t      $t         #303438
		    urgent_workspace   $t      $t         #303438
		    inactive_workspace #303438 #303438    #dfe5eb
		    }
																	   
    status_command while ~/.config/sway/swaybar.sh; do sleep 1; done
}

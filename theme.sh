set $wallpaper ~/Downloads/bg.png
set $t #00000000

font pango:cozette bold 11


default_border pixel 0

# class                 border  background text    indicator
client.focused          $t      $t         $t      $t    
client.focused_inactive #333436 #333436    #333436 #333436     
client.unfocused        $t      $t         $t      $t
client.urgent           #853739 #853739    #853739 #853739
client.placeholder      $t      $t         $t      $t       
client.background       $t      $t         $t      $t        

output * bg $wallpaper fill

bar {
	position top

	colors {               
		statusline         #d0d7dd
		background         #333436e4

#                                  border    background text	
		active_workspace   #333436e4 #333436e4  #d0d7dd
		focused_workspace  #333436e4 #333436e4  #854f8c
		urgent_workspace   #853739   #853739    #333436e4
		inactive_workspace #333436e4 #333436e4  #d0d7dd
		}
																	  
		status_command while ~/.config/sway/swaybar.sh; do sleep 1; done
}

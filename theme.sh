set $wallpaper ~/Downloads/bg.jpg
set $t #00000000

font pango:Unifont 12

default_border pixel 2

# class                 border  background text    indicator
client.focused          #69a9c6 #69a9c6    #69a9c6 #69a9c6      
client.focused_inactive #42484d #42484d    #42484d #42484d      
client.unfocused        #303438 #303438    #303438 #303438   
client.urgent           #cc6655 #cc6655    #cc6655 #cc6655 
client.placeholder      $t      $t         $t      $t       
client.background       $t      $t         $t      $t        

output * bg $wallpaper fill

bar {
	position top

	colors {               
		statusline         #dfe5eb
		background         #303438

#                          border  background text	
		active_workspace   #42484d #42484d    #dfe5eb
		focused_workspace  #69a9c6 #69a9c6    #303438
		urgent_workspace   #cc6655 #cc6655    #303438
		inactive_workspace #303438 #303438    #dfe5eb
		}
																	   
		status_command while ~/.config/sway/swaybar.sh; do sleep 1; done
}

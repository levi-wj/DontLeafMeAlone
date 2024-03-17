extends Button


func _ready():
	pass
func _on_button_down():
	# Darken the icon
	modulate = Color(0.75, 0.75, 0.75) # Adjust these values to darken the icon

func _on_button_up():
	# Reset the icon color
	modulate = Color(1, 1, 1) # Full color, no darkening
	
	# Look through the scene tree to find the shop_menu UI

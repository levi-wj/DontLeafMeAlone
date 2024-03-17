extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_down():
	# Darken the icon
	modulate = Color(0.75, 0.75, 0.75) # Adjust these values to darken the icon

func _on_button_up():
	# Reset the icon color
	modulate = Color(1, 1, 1) # Full color, no darkening

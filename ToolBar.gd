extends CanvasLayer

var mode = '' # Can be water, plant, move, sell, or ''
var active_button = null

func set_mode(new_mode, new_button):
	if (new_mode != mode):
		if active_button:
			active_button.set_button_active(false)
		new_button.set_button_active(true)
		active_button = new_button
		mode = new_mode
		print(mode)
		
func tilemap_event_happened():
	active_button.start_timer()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

extends PathFollow2D

@export var move_speed = 50
@export var health = 100

var last_frame_pos

func _physics_process(delta):
	set_progress(get_progress() + move_speed * delta)
	
	if (last_frame_pos):
		if (last_frame_pos.x > position.x):
			scale.x = -1
		else:
			scale.x = 1
	last_frame_pos = position
	
	if (progress_ratio >= 1): # we finished the path
		queue_free() # Delete node

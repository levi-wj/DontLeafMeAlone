extends PathFollow2D

@export var move_speed = 50
@export var health = 100

func _physics_process(delta):
	set_progress(get_progress() + move_speed * delta)

extends Node2D

@export var move_speed = 50



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2.RIGHT * delta * move_speed)

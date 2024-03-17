extends Area2D

const SPEED = 10

var target = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func set_target(new_target):
	target = new_target

func _physics_process(delta):
	if target and is_instance_valid(target):
		# Calculate direction to the center of the Area2D
		var direction = position.direction_to(target.position)

		var velocity = direction * SPEED
		position += velocity


extends Area2D

@export var damage = 5
@export var SPEED = 10

var target = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func set_target(new_target):
	target = new_target
	new_target.projected_health -= damage

func _physics_process(delta):
	if target:
		if is_instance_valid(target):
			# Calculate direction to the center of the Area2D
			var direction = position.direction_to(target.global_position)
			var velocity = direction * SPEED
			position += velocity
		else:
			queue_free()


func _on_area_entered(area):
	var bug = area.get_parent()
	if bug == target:
		bug.take_damage(damage)
		queue_free()

extends Node

signal died
signal health_changed

@export var max_health: float = 10
var current_health

# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = max_health

# damage the entity this componet is attached to by a damage_amount
func damage(damage_amount: float):
	current_health = max(current_health - damage_amount, 0)
	health_changed.emit()
	Callable(check_death).call_deferred()
		
# get the current health of the entity this component is attached to
func get_health_percent():
	if max_health <= 0:
		return 0
		
	return min(current_health / max_health, 1)

# check if the entity this component is attached to has died
func check_death():
	if current_health == 0:
		# emit the died signal
		died.emit()
		# queue_free() will remove the node from the scene tree
		owner.queue_free()

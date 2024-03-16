extends CharacterBody2D

@export var move_speed = 50

func _ready():
	velocity.x = move_speed

func _process(delta):
	move_and_slide()


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("lol it works")

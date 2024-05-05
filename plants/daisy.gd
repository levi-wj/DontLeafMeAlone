extends Area2D

@onready var health_component = $HealthComponent

func deal_damage(amt):
	health_component.damage(amt)


func _on_health_component_died():
	# Game over
	print("Game over")

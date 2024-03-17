extends Area2D

signal take_DMG

@export var sprites = []
@export var projectile: Texture2D

@onready var health_component = $HealthComponent
@onready var health_bar = $HealthBar
@onready var sprite = $Sprite2D

var stage = 0
const MAX_STAGE = 2

func _ready():
	health_component.health_changed.connect(on_health_change)
	update_health_display()	
	
	
func check_deal_damage():
	health_component.damage(1)
	print(health_component.current_health)


func update_health_display():
		health_bar.value = health_component.get_health_percent()


func on_damage_interval_timer_timeout():
	check_deal_damage()


func on_health_change():
	update_health_display()
	

func grow():
	if (stage < MAX_STAGE):
		stage += 1
		sprite.texture = sprites[stage]

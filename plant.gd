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
	
	
func deal_damage(amt):
	health_component.damage(amt)


func update_health_display():
	health_bar.value = health_component.get_health_percent()


func on_health_change():
	update_health_display()
	

func grow():
	if (stage < MAX_STAGE):
		stage += 1
		sprite.texture = sprites[stage]

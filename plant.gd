extends Area2D

signal take_DMG

@export var sprites = []
@export var projectile: PackedScene
@export var attack_delay = 4
@export var range = 10

@onready var health_component = $HealthComponent
@onready var health_bar = $HealthBar
@onready var sprite = $Sprite2D
@onready var timer = $Timer

var target_bug = null
var stage = 0
const MAX_STAGE = 2

func _ready():
	timer.wait_time = attack_delay
	health_component.health_changed.connect(on_health_change)
	update_health_display()
	
	
func deal_damage(amt):
	health_component.damage(amt)


func update_health_display():
	health_bar.value = health_component.get_health_percent()


func on_health_change():
	update_health_display()


func find_nearby_bug(radius):
	var bugs = get_tree().get_nodes_in_group("Bug")
	print(bugs)
	for bug in bugs:
		var distance = position.distance_to(bug.position)
		print(distance)
		if distance < radius * 100:
			return bug
	return null

func grow():
	if (stage < MAX_STAGE):
		stage += 1
		sprite.texture = sprites[stage]


func _on_timer_timeout():
	if stage > 0: # is plant grown
		if !target_bug:
			target_bug = find_nearby_bug(range)

		if (target_bug):
			var projectile_inst = projectile.instantiate()
			get_tree().get_root().add_child(projectile_inst)
			projectile_inst.transform.origin = transform.origin
			projectile_inst.set_target(target_bug)
		

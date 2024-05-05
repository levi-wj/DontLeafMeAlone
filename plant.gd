extends Area2D

signal take_DMG

@export var sprites = []
@export var projectile: PackedScene
@export var attack_delay = 4
@export var range = 7

@onready var health_component = $HealthComponent
@onready var sprite = $Sprite2D
@onready var timer = $Timer

var target_bug = null
var stage = 0
const MAX_STAGE = 2

func _ready():
	timer.wait_time = attack_delay
	
	
func deal_damage(amt):
	health_component.damage(amt)


func find_bug_in_range():
	var bugs = get_tree().get_nodes_in_group("Bug")
	for bug in bugs:
		if bug.projected_health > 0:
			if is_bug_in_range(bug):
				return bug
	return null

func grow():
	if (stage < MAX_STAGE):
		stage += 1
		sprite.texture = sprites[stage]
		
func is_bug_in_range(bug):
	return position.distance_to(bug.global_position) < range * 100


func _on_timer_timeout():
	if stage > 0: # is plant grown
		if !target_bug:
			target_bug = find_bug_in_range()
		
		if (target_bug):
			if !is_bug_in_range(target_bug): # do we have a valid target in range?
				target_bug = find_bug_in_range()
			var projectile_inst = projectile.instantiate()
			get_tree().get_root().add_child(projectile_inst)
			projectile_inst.transform.origin = transform.origin
			projectile_inst.set_target(target_bug)
		

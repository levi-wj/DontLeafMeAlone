extends PathFollow2D

@export var move_speed = 50
@export var health = 2
@export var attack_str = 2

@onready var health_component = $HealthComponent
@onready var health_bar = $HealthBar

var last_frame_pos
var attacking = false
var target_plant = null

func _ready():
	var rng = RandomNumberGenerator.new()
	move_speed += rng.randf_range(-5.0, 5.0)
	
	# Health bar init
	health_component.health_changed.connect(update_health_display)
	update_health_display()

func update_health_display():
	health_bar.value = health_component.get_health_percent()

func take_damage(amt):
	health_component.damage(amt)

func _physics_process(delta):
	if !attacking:
		set_progress(get_progress() + move_speed * delta)
	else:
		if is_instance_valid(target_plant):
			target_plant.deal_damage(attack_str * delta)
		else:
			target_plant = null
			attacking = false
		
	if (last_frame_pos):
		if (last_frame_pos.x > position.x):
			scale.x = -1
		else:
			scale.x = 1
			
	
	last_frame_pos = position
	
	if (progress_ratio >= 1): # we finished the path
		queue_free() # Delete node


func _on_area_2d_area_entered(area):
	var groups = area.get_groups();
	if (groups and groups[0] == 'Plant'):
		attacking = true
		target_plant = area

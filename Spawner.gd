extends Path2D

@export var enemies = [
	preload('res://fly_enemy.tscn')
]

@export var timeSinceLastSpeedup = -6.0
@export var speedupInterval = 10.0
@export var timeSinceLastSpawn = 5.0 # used to be -5.0
@export var spawnInterval = 11.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timeSinceLastSpawn += delta
	timeSinceLastSpeedup += delta
	
	if (timeSinceLastSpawn > spawnInterval):
		var enemy = enemies[0].instantiate()
		add_child(enemy)
		timeSinceLastSpawn = 0.0
	
	if (timeSinceLastSpeedup > speedupInterval):
		spawnInterval /= 1.2
		timeSinceLastSpeedup = 0
		

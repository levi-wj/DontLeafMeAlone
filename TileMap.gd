extends TileMap

const MAP_SIZE = {'X': 14, 'Y': 8}
const TILE_SIZE = 128


@onready var sunflower = preload("res://sunflower.tscn")
@onready var toolbar = $"../Toolbar"

var plants = []

func _ready():
	for x in MAP_SIZE.Y:
		plants.append([])
		for y in MAP_SIZE.X:
			plants[x].append(0)

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var local_pos = to_local(event.position)
		var tile_pos = local_to_map(local_pos)
		
		# Check that click is in playable area
		if (tile_pos[0] <= MAP_SIZE.X and tile_pos[1] <= MAP_SIZE.Y):
			var is_path = (get_cell_tile_data(0, tile_pos).terrain_set == 0)
			toolbar.tilemap_event_happened()
			if (is_path):
				# Check that the tile is unoccupied
				if (plants[tile_pos[1]][tile_pos[0]] == 0):
					var sunflower_inst = sunflower.instantiate()
					get_tree().get_root().add_child(sunflower_inst)
					sunflower_inst.global_position = Vector2((tile_pos[0] * TILE_SIZE) + TILE_SIZE / 2, (tile_pos[1] * TILE_SIZE) + TILE_SIZE / 2)
					plants[tile_pos[1]][tile_pos[0]] = 1

extends TileMap

const MAP_SIZE = {'X': 14, 'Y': 8}
const TILE_SIZE = 128


@onready var sunflower = preload("res://plants/sunflower.tscn")
@onready var toolbar = $"../Toolbar"

var plants = []

func _ready():
	for x in MAP_SIZE.Y:
		plants.append([])
		for y in MAP_SIZE.X:
			plants[x].append(null)
			
func is_event_left_click(event):
	return (event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT)
			
func is_click_in_playable_area(tile_pos):
	return (tile_pos[0] <= MAP_SIZE.X and tile_pos[1] <= MAP_SIZE.Y)
	
func global_pos_to_tile_coord(global_pos):
	var local_pos = to_local(global_pos)
	return local_to_map(local_pos)

func _unhandled_input(event):
	if toolbar.is_active_tool_ready() and is_event_left_click(event):
		var tile_pos = global_pos_to_tile_coord(event.position)
		
		if (is_click_in_playable_area(tile_pos)):
			var is_path = (get_cell_tile_data(0, tile_pos).terrain_set == 0)
			var is_tile_occupied = (plants[tile_pos[1]][tile_pos[0]] != null);
			
			if (is_path):
				if (toolbar.mode == 'water'):
					if (is_tile_occupied):
						water(tile_pos)
						toolbar.tilemap_event_happened()
				elif (toolbar.mode == 'plant'):
					if (!is_tile_occupied):
						plant(tile_pos)
						toolbar.tilemap_event_happened()
				elif (toolbar.mode == 'sell'):
					if (is_tile_occupied):
						sell(tile_pos)
						toolbar.tilemap_event_happened()


func plant(tile_pos):
	var plant_inst = sunflower.instantiate()
	get_tree().get_root().add_child(plant_inst)
	plant_inst.global_position = Vector2((tile_pos[0] * TILE_SIZE) + TILE_SIZE / 2, (tile_pos[1] * TILE_SIZE) + TILE_SIZE / 2)
	plants[tile_pos[1]][tile_pos[0]] = plant_inst

func water(tile_pos):
	plants[tile_pos[1]][tile_pos[0]].grow()
	
func sell(tile_pos):
	var plant = plants[tile_pos[1]][tile_pos[0]]
	
	plant.queue_free()
	plants[tile_pos[1]][tile_pos[0]] = null


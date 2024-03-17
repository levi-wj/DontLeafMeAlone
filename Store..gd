extends CanvasLayer
# Called when the node enters the scene tree for the first time.
@onready var flower_store = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/FlowerStore
@onready var fertilizer_store = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/FertilizerStore

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_tab_bar_tab_button_pressed(tab):
	print(tab)

func _on_tab_bar_tab_changed(tab):
	if tab == 0:
		fertilizer_store.visible = false
		flower_store.visible= true
		
	elif tab == 1:
		flower_store.visible= false
		fertilizer_store.visible = true

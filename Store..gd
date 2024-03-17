extends CanvasLayer
# Called when the node enters the scene tree for the first time.
@onready var tool_bar = $"../Toolbar"

@onready var flower_store = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/FlowerStore
@onready var fertilizer_store = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/FertilizerStore

@onready var tulip_card = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/FlowerStore/MarginContainer/Tulips
@onready var lily_card = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/FlowerStore/MarginContainer2/Lily
@onready var sun_flower_card = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/FlowerStore/MarginContainer3/SunFlower
@onready var fertilizer_health_card = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/FertilizerStore/MarginContainer/FertilizerHealth
@onready var fertilizer_speed_card = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/FertilizerStore/MarginContainer2/FertilizerSpeed

@export var tulips_price = 1
@export var sun_flower_price = 1
@export var lily_price = 1
@export var fert_speed_price = 1
@export var fert_health_price = 1



var money = 0

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	money = tool_bar.get_money()

func _on_tab_bar_tab_button_pressed(tab):
	print(tab)

func _on_tab_bar_tab_changed(tab):
	if tab == 0:
		fertilizer_store.visible = false
		flower_store.visible= true
		
	elif tab == 1:
		flower_store.visible= false
		fertilizer_store.visible = true

func spend_money(amt):
	tool_bar.set_money(money - amt)
	
	
func _on_tulips_button_up():
	if (money >= tulips_price):
		spend_money(tulips_price)
	else:
		return

func _on_lily_button_up():
	if (money >= lily_price):
		spend_money(lily_price)
	else:
		return

func _on_sun_flower_button_up():
	if (money >= sun_flower_price):
		spend_money(sun_flower_price)
	else:
		return
		
func _on_fertilizer_health_button_up():
	if (money >= fert_health_price):
		spend_money(fert_health_price)
	else:
		return

func _on_fertilizer_speed_button_up():
	if (money >= fert_speed_price):
		spend_money(fert_speed_price)
	else:
		return

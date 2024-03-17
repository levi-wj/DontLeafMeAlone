extends CanvasLayer

const START_MONEY = 4

var mode = null # Can be water, plant, move, sell, or ''
var selected_plant = null
var active_button = null
var shopMenuIsOpen = false
var money = 0

@onready var shopMenu = $"../ShopMenu"
@onready var shopButton = $Toolbar/TextureRect/VBoxContainer/shopButton
@onready var money_label = $Toolbar/TextureRect/VBoxContainer/MarginContainer/VBoxContainer/Money/Label

@onready var slot1=$Toolbar/TextureRect/VBoxContainer/MarginContainer/VBoxContainer/solt1
@onready var slot2=$Toolbar/TextureRect/VBoxContainer/MarginContainer/VBoxContainer/slot2
@onready var slot3=$Toolbar/TextureRect/VBoxContainer/MarginContainer/VBoxContainer/slot3


func _ready():
	set_money(START_MONEY)

func set_mode(new_mode, new_button, new_plant):
	if (new_mode != mode):
		if active_button:
			active_button.set_button_active(false)
		new_button.set_button_active(true)
		active_button = new_button
		mode = new_mode
		selected_plant = new_plant
		print(mode)
		
func tilemap_event_happened():
	if active_button:
		active_button.start_timer()
		
func is_active_tool_ready():
	if (active_button):
		return !active_button.is_cooldown_going
	else:
		return false

func set_money(amt):
	money = amt
	money_label.text = str(amt)

func get_money():
	return money
	
func _on_shop_button_button_down():
	if shopMenuIsOpen:
		shopMenu.visible = false
		shopMenuIsOpen = false
	else:
		shopMenu.visible = true
		shopMenuIsOpen = true

func set_toolbar_slot(item, object):
	if slot1.is_mode_empty():
		slot1.set_mode_to(item, object)
		return true
	elif slot2.is_mode_empty():
		slot2.set_mode_to(item, object)
		return true
	elif slot3.is_mode_empty():
		slot3.set_mode_to(item, object)
		return true
	return false

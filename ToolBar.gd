extends CanvasLayer

const START_MONEY = 4

var mode = '' # Can be water, plant, move, sell, or ''
var active_button = null
var shopMenuIsOpen = false
var money = 0

@onready var shopMenu = $"../ShopMenu"
@onready var shopButton = $Toolbar/TextureRect/VBoxContainer/shopButton
@onready var money_label = $Toolbar/TextureRect/VBoxContainer/MarginContainer/VBoxContainer/Money/Label

func _ready():
	set_money(START_MONEY)

func set_mode(new_mode, new_button):
	if (new_mode != mode):
		if active_button:
			active_button.set_button_active(false)
		new_button.set_button_active(true)
		active_button = new_button
		mode = new_mode
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

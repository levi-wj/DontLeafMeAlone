extends CanvasLayer

var mode = '' # Can be water, plant, move, sell, or ''
var active_button = null
var shopMenuIsOpen = false


@onready var shopMenu = $"../ShopMenu"
@onready var shopButton = $Toolbar/TextureRect/VBoxContainer/shopButton


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


func _on_shop_button_button_down():
	if shopMenuIsOpen:
		shopMenu.visible = false
		shopMenuIsOpen = false
	else:
		shopMenu.visible = true
		shopMenuIsOpen = true

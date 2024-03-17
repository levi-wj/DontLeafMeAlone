extends MarginContainer

@export var setModeTo = ''
@export var btn_image: Texture2D

@onready var progress_bar = $TextureRect/ToolButton/TextureProgressBar
@onready var timer = $TextureRect/ToolButton/Timer
@onready var time = $TextureRect/ToolButton/Time
@onready var button = $TextureRect/ToolButton
@onready var toolbar = $"../../../../../.."
@onready var active_indicator = $ActiveIndicator

var is_cooldown_going = false

func _ready():
	progress_bar.max_value = timer.wait_time
	button.texture_normal = btn_image
	
	
func _process(_delta):
	time.text = "%3.1f" % timer.time_left
	progress_bar.value = timer.time_left

func _on_timer_timeout():
	button.disabled = false
	is_cooldown_going = false
	time.text = ""
	
func set_button_active(is_active):
	active_indicator.visible = is_active

func start_timer():
	timer.start()
	button.disabled = true
	is_cooldown_going = true
	
func _on_tool_button_pressed():
	toolbar.set_mode(setModeTo, self)

extends MarginContainer

@export var setModeTo = ''

@onready var progress_bar = $TextureRect/ToolButton/TextureProgressBar
@onready var timer = $TextureRect/ToolButton/Timer
@onready var time = $TextureRect/ToolButton/Time
@onready var button = $TextureRect/ToolButton
@onready var toolbar = $"../../../../../.."
@onready var active_indicator = $ActiveIndicator

func _ready():
	progress_bar.max_value = timer.wait_time
	
func _process(_delta):
	time.text = "%3.1f" % timer.time_left
	progress_bar.value = timer.time_left

func _on_timer_timeout():
	button.disabled = false
	time.text = ""
	
func set_button_active(is_active):
	active_indicator.visible = is_active

func start_timer():
	timer.start()
	button.disabled = true
	
func _on_tool_button_pressed():
	toolbar.set_mode(setModeTo, self)

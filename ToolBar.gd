extends TextureButton

@onready var progress_bar = $TextureProgressBar
@onready var timer = $Timer
@onready var time = $Time

func _ready():
	progress_bar.max_value = timer.wait_time
	set_process(false)
	
func _process(_delta):
	time.text = "%3.1f" % timer.time_left
	progress_bar.value = timer.time_left


func _on_pressed():
	timer.start()
	disabled = true
	set_process(true)


func _on_timer_timeout():
	disabled = false
	time.text = ""
	set_process(false)
	
	
	

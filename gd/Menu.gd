extends Control
@onready var fullscreenBtn = $Fullscreen
var windowMode

# Called when the node enters the scene tree for the first time.
func _ready():
	windowMode = "windowed"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://tscn/start.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_fullscreen_pressed():
	if windowMode == "windowed":
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		windowMode = "fullscreen"
		fullscreenBtn.text = "Exit Fullscreen"
	
	elif windowMode == "fullscreen":
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		windowMode = "windowed"
		fullscreenBtn.text = "Fullscreen"

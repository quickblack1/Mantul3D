extends Node3D

var numBlueBox = 8
var numRedBox = 8
var paused : bool = false
var bolaBiru = preload("res://tscn/blue_ball.tscn")
var bolaMerah = preload("res://tscn/red_ball.tscn")
var windowMode

@onready var numBlueBoxLabel = $Control/BlueLabel/BlueScore
@onready var numRedBoxLabel = $Control/RedLabel/RedScore
#@onready var waklu = $BlueBall
#@onready var waklu = $Control
@onready var blueBall = $BlueBall
@onready var redBall = $RedBall
@onready var control = $Control
#@onready var mob = $Boxes/BlueBox
#@onready var mob2 = $Boxes/RedBox
@onready var pauseLabel = $Control2
@onready var fullscreenBtn = $Control2/Fullscreen

# Called when the node enters the scene tree for the first time.
func _ready():
	
	numBlueBoxLabel.text = str(numBlueBox)
	numRedBoxLabel.text = str(numRedBox)
	
	#mob.squashed.connect($Control._on_Mob_squashed)
	#mob2.squashed2.connect($Control._on_Mob_squashed2)
	blueBall.squashed.connect($Control._on_Mob_squashed)
	redBall.squashed2.connect($Control._on_Mob_squashed2)
	#control.sPauseGame.connect(pause_game)
	
	windowMode = "windowed"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	#if Input.is_action_just_pressed("shoot"):
		#shoot()
	
	#if Input.is_action_just_pressed("ui_cancel"):
		
		#pass
		#get_tree().quit()
		#get_tree().paused = true
		#print("di sini")
	
func shoot():
	# "Muzzle" is a Marker2D placed at the barrel of the gun.
	var b = bolaBiru.instantiate()
	add_child(b)
	b.squashed.connect($Control._on_Mob_squashed)

func shoot2():
	# "Muzzle" is a Marker2D placed at the barrel of the gun.
	var b = bolaMerah.instantiate()
	add_child(b)
	b.squashed2.connect($Control._on_Mob_squashed2)
	


func _on_button_pressed():
	shoot()


func _on_button_2_pressed():
	shoot2()




func _on_play_again_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
		#get_tree().paused = false

	#
	#print("waklu")

#func _unhandled_input(event):
	#if event.is_action_pressed("ui_accept"):
		#get_tree().paused = false
		# warning-ignore:return_value_discarded
		#get_tree().reload_current_scene()


#func pause_game():
	#print("pause game waklu")
	#get_tree().paused == true


func _on_control_s_delete_ball():
	pass
	#queue_free()
	
func _unhandled_input(event):
	#if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
	if event.is_action_pressed("ui_cancel"):
		# warning-ignore:return_value_discarded
		#print("di sini")
		#get_tree().paused = false
		get_tree().paused = !get_tree().paused
		pauseLabel.visible = !pauseLabel.visible
		#paused = true
		#get_tree().reload_current_scene()
		#print(get_tree().paused)


func _on_replay_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


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

extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#self.position = get_viewport_rect().size/2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_pressed():
	get_tree().change_scene_to_file("res://tscn/main.tscn")

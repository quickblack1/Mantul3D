extends StaticBody3D

@onready var box = $CollisionShape3D/MeshInstance3D
var warnaKotak

signal squashed
signal squashed2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func hit(b):
	var a = StandardMaterial3D.new()
	#print(b)
	
	if b == 1:
		
		a.albedo_color = Color(0.00,0.11,1.00, 1.00)
		#a.shading_mode = BaseMaterial3D.SHADING_MODE_PER_PIXEL
		warnaKotak = "biru"
		set_collision_layer_value(4, true)
		set_collision_layer_value(3, false)
		
		set_collision_mask_value(1, true)
		set_collision_mask_value(2, false)
		
		#squash(1)
		#squashed.emit()
		
	elif b == 2:
		a.albedo_color = Color(1.00,0.00,0.01, 1.00)
		warnaKotak = "merah"
		set_collision_layer_value(4, false)
		set_collision_layer_value(3, true)
		
		set_collision_mask_value(1, false)
		set_collision_mask_value(2, true)
		#squashed.emit()
		#squash(2)
		
	a.flags_transparent = true
	#box.material_override = a
	box.material_overlay = a

#func squash(c):
	#pass
	#print(c)
	#if c==1:
		#squashed.emit()
		#print("emit")
	#elif c==2:
		#squashed2.emit()
		#print("emit2")

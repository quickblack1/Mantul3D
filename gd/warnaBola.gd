extends MeshInstance3D

var randomColor = false
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	if randomColor:
	
		rng.randomize()
		
		var first = rng.randi_range(0, 255)
		var second = rng.randi_range(0, 255)
		var third = rng.randi_range(0, 255)
		#var fourth = rng.randi_range(0, 255)
		
		
		var a = StandardMaterial3D.new()
		
		a.albedo_color = Color8(first,second,third, 255)
		
		a.flags_transparent = true
		self.material_override = a


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

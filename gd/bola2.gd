extends CharacterBody3D

var speed = 50
var direction = Vector3(randf() * 2 - 1, 0, randf() * 2 - 1)
var pantulan = Vector3(speed, 0, speed)
var collision

@onready var bounceSound = $AudioStreamPlayer

signal squashed2
# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = direction * speed
	
	#velocity = pantulan
	#print(velocity)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(delta):
	
	collision = move_and_collide(velocity * delta)
	#print(collision)
	if collision:
		#print(collision)
		#print(collision.get_normal())
		#velocity = velocity.bounce(collision.get_normal())
		#print(collision.get_collider_shape_index())
		#print(collision.get_collider_rid())
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider().has_method("hit"):
			bounceSound.play()
			squashed2.emit()
			#var mob = collision.get_collider()
			#mob.squash(2)
			collision.get_collider().hit(2)
		#collision = move_and_collide(velocity * delta)
	#position += speed * delta * direction

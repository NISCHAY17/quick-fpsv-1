extends RigidBody3D

@onready var bat_model: Node3D = %bat_model
var speed = randf_range(1.0, 1.7)

@onready var player = get_node("/root/Game/Player")

func _physics_process(delta):
	var target = player.global_position
	target.y = global_position.y
	
	var direction = global_position.direction_to(target)
	linear_velocity = direction * speed
	
	# FIXED THE ROTATION
	bat_model.look_at(target, Vector3.UP)
	bat_model.rotate_y(PI) # BECUZ model faces +Z

func take_damage():
	bat_model.hurt()

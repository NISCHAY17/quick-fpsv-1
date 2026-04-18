extends RigidBody3D
var health = 3
@onready var bat_model: Node3D = %bat_model
var speed = randf_range(1.0, 1.7)

@onready var player = get_node("/root/Game/Player")
@onready var timer: Timer = %Timer

func _physics_process(delta):
	var target = player.global_position
	target.y = global_position.y
	
	var direction = global_position.direction_to(target)
	linear_velocity = direction * speed
	
	# FIXED THE ROTATION
	bat_model.look_at(target, Vector3.UP)
	bat_model.rotate_y(PI) # BECUZ model faces +Z

func take_damage():
	if health == 0:
		return
	bat_model.hurt()
	health -= 1
	if health == 0:
		set_physics_process(false)
		gravity_scale = 1.0
		var direction = -1.0 * global_position.direction_to(player.global_position)
		var random_upword_force = Vector3.UP * randf_range(1.0, 6.7)
		apply_central_force(direction * 10.0 * random_upword_force)
		timer.start()
		lock_rotation = false

func _on_timer_timeout() -> void:
	queue_free()

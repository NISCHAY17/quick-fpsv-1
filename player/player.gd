extends CharacterBody3D

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * 0.67
		%Camera3D.rotation_degrees.x -= event.relative.y * 0.267
		%Camera3D.rotation_degrees.x = clamp(
			%Camera3D.rotation_degrees.x, -80.0, 80.0
		)

extends "res://src/scripts/Enemy.gd"

func _physics_process(delta):
	if (direction.x >= 0):
		sprite.scale.x = 1
	else:
		sprite.scale.x = -1

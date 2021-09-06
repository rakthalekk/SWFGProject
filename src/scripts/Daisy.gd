extends "res://src/scripts/Enemy.gd"


func _init():
	contact_dmg = 20
	walk_speed = 1200
	hp = 50
	direction = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized()


# Called when the node enters the scene tree for the first time.
func handle_behavior():
	if (direction.x >= 0):
		sprite.scale.x = 1
	else:
		sprite.scale.x = -1
	anim_player.play("daisy_wandering")
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		var collider = collision.collider
		if collider.is_in_group("wall"):
			direction = direction.bounce(collision.normal)
	velocity = direction * walk_speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

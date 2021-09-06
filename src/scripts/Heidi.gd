extends "res://src/scripts/Enemy.gd"

var WORD_ATTACK = preload("res://src/scenes/WordAttack.tscn")

func _init():
	contact_dmg = 5
	walk_speed = 100
	hp = 20

func handle_behavior():
	if (direction.x >= 0):
		sprite.scale.x = 1
	else:
		sprite.scale.x = -1
	anim_player.play("heidi_wandering")
	if target:
		direction = (target.position - position).normalized();
		velocity = direction * walk_speed
	else:
		if walk_counter > 0:
			walk_counter -= 1;
		else:
			if (rand_range(0, 1) > 0.5):
				direction = Vector2.ZERO
			else:
				direction = Vector2(rand_range(-1, 1), rand_range(-1, 1))
			walk_counter = rand_range(30, 50)
		velocity = direction * walk_speed


func attack():
	var atk = WORD_ATTACK.instance()
	if (direction != Vector2.ZERO):
		atk.direction = direction.normalized()
	else:
		atk.direction = Vector2(rand_range(-1, 1), rand_range(-1, 1)).normalized()
	atk.position = position
	get_parent().add_child(atk)

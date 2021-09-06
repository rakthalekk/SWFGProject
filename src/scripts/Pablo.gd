extends "res://src/scripts/Enemy.gd"


func ready():
	contact_dmg = 10
	hp = 30


func handle_behavior():
	if target:
		anim_player.play("speed_flossing")
		direction = (target.position - position).normalized();
		velocity = direction * run_speed
	else:
		anim_player.play("flossing")
		if walk_counter > 0:
			walk_counter -= 1;
		else:
			if (rand_range(0, 1) > 0.5):
				direction = Vector2.ZERO
			else:
				direction = Vector2(rand_range(-1, 1), rand_range(-1, 1))
			walk_counter = rand_range(30, 50)
		velocity = direction * walk_speed


func ouchy_noise():
	$DeathThrows.play()

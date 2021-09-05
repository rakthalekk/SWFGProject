extends KinematicBody2D

var target = null
var direction = Vector2.ZERO
var velocity = Vector2.ZERO
var speed = 1200

onready var anim_player = $AnimationPlayer

func _physics_process(delta):
	if target:
		anim_player.play("speed_flossing")
		direction = (target.position - position).normalized();
		
		for i in get_slide_count():
			var collider = get_slide_collision(i).collider
			if collider is GatorGirl:
				collider.push(direction, speed * 2)
	else:
		anim_player.play("flossing")
		direction = Vector2(rand_range(-1, 1), rand_range(-1, 1))
	velocity = direction * speed
	velocity = move_and_slide(velocity)
		


func _on_RageZone_body_entered(body):
	target = body


func _on_RageZone_body_exited(body):
	target = null

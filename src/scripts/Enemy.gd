extends KinematicBody2D

var target = null
var velocity = Vector2.ZERO
var speed = 800

func _physics_process(delta):
	if target:
		var direction = (target.position - position).normalized()
		velocity = direction * speed
		velocity = move_and_slide(velocity)
		
		for i in get_slide_count():
			var collider = get_slide_collision(i).collider
			if collider is GatorGirl:
				#collider.push()
				print("oof")


func _on_RageZone_body_entered(body):
	target = body


func _on_RageZone_body_exited(body):
	target = null

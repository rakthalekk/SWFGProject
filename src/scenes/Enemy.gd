extends KinematicBody2D

var target = null
var velocity = Vector2.ZERO
var speed = 800

func _physics_process(delta):
	if target:
		look_at(target.position)
		velocity = transform.x * speed
		velocity = move_and_slide(velocity)


func _on_RageZone_body_entered(body):
	target = body


func _on_RageZone_body_exited(body):
	target = null

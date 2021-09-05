class_name WordAttack
extends Area2D

var direction = Vector2.ZERO
var speed = 15
var lifespan = 300
var dmg = 5

func _physics_process(delta):
	if (lifespan <= 0):
		queue_free()
	position += direction * speed
	lifespan -= 1;


func _on_WordAttack_body_entered(body):
	if body is GatorGirl:
		body.damage(dmg)
		queue_free()

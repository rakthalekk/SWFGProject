extends KinematicBody2D

signal drop_item

var target = null
var direction = Vector2.ZERO
var velocity = Vector2.ZERO
var run_speed = 1200
var walk_speed = 400
var walk_counter = 0
var push_counter = 0
var hp = 30

onready var anim_player = $AnimationPlayer
onready var sprite = $Sprite

func _physics_process(delta):
	if (hp <= 0):
		perish()
	if (push_counter > 0):
		push_counter -= 1;
		velocity = move_and_slide(velocity)
		return
	if target:
		anim_player.play("speed_flossing")
		direction = (target.position - position).normalized();
		velocity = direction * run_speed
		
		for i in get_slide_count():
			var collider = get_slide_collision(i).collider
			if collider is GatorGirl:
				collider.push(direction, run_speed * 2)
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
	velocity = move_and_slide(velocity)
		


func _on_RageZone_body_entered(body):
	target = body


func _on_RageZone_body_exited(body):
	target = null


func push(direction, speed):
	push_counter = 10
	velocity = direction * speed


func damage(val):
	hp -= val


func perish():
	#if (rand_range(0, 1) > 0.5):
	emit_signal("drop_item", position)
	print("hello")
	queue_free()

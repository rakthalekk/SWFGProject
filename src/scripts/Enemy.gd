extends KinematicBody2D

const ITEM = preload("res://src/scenes/Item.tscn")

var target = null
var direction = Vector2.ZERO
var velocity = Vector2.ZERO
var run_speed = 1000
var walk_speed = 400
var walk_counter = 0
var push_counter = 0
var hp = 30
var contact_dmg = 10
var food_drop = false

onready var anim_player = $AnimationPlayer
onready var sprite = $Sprite
onready var hit_sound = $HitSound

func _physics_process(delta):
	if (hp <= 0 && push_counter <= 0):
		anim_player.play("oomph")
		if (!food_drop):
			food_drop = true
			var it = ITEM.instance()
			it.position = position
			get_parent().add_child(it)
		return
	if (push_counter > 0):
		push_counter -= 1;
		anim_player.play("push")
		velocity = move_and_slide(velocity)
		return
	for i in get_slide_count():
		var collider = get_slide_collision(i).collider
		if collider is GatorGirl:
			collider.damage(contact_dmg)
			collider.push(direction, run_speed * 3)
	handle_behavior()
	velocity = move_and_slide(velocity)
		

func handle_behavior():
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


func _on_RageZone_body_entered(body):
	target = body


func _on_RageZone_body_exited(body):
	target = null


func push(direction, speed):
	push_counter = 10
	velocity = direction * speed


func damage(val):
	hp -= val
	hit_sound.play()


func perish():
	queue_free()

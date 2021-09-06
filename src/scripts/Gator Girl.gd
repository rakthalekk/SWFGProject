class_name GatorGirl
extends KinematicBody2D

const SOSPARKLY = preload("res://assets/Music/msu_sosparkly.ogg")
const BABY_RAGE = preload("res://assets/Music/mus_babyrage.ogg")
var in_classroom = true
onready var music = $"/root/Music/AudioStreamPlayer"

signal update_hp_count
signal update_inventory
signal game_over

var velocity = Vector2.ZERO
var speed = 1000
var move_direction = Vector2.ZERO
var attacking = false
var push_counter = 0
var hp = 50
var inventory = {}

onready var anim_player = $AnimationPlayer
onready var sprite = $Sprite

func _physics_process(delta):
	if (hp <= 0 && push_counter <= 0):
		anim_player.play("oomph")
		return
	if (push_counter > 0):
		push_counter -= 1;
		anim_player.play("push")
		velocity = move_and_slide(velocity)
		return
	if (attacking):
		return
	var move_direction = get_direction()
	if (move_direction.x != 0):
		anim_player.play("right_walk")
		sprite.scale.x = move_direction.x
	elif (move_direction.y < 0):
		anim_player.play("back_walk")
	elif (move_direction.y > 0):
		anim_player.play("forward_walk")
	else:
		anim_player.play("idle")
	velocity = move_direction.normalized() * speed
	velocity = move_and_slide(velocity)
	
func _input(event):
	if event.is_action_pressed("attack"):
		attacking = true
		var mouse_pos = get_viewport().get_mouse_position();
		var xdis = mouse_pos.x - 640
		var ydis = mouse_pos.y - 350
		if (abs(xdis) > abs(ydis)):
			anim_player.play("right_attack")
			if (xdis > 0):
				sprite.scale.x = 1
			else:
				sprite.scale.x = -1
		else:
			if (ydis > 0):
				anim_player.play("forward_attack")
			else:
				anim_player.play("back_attack")


func get_direction(): #get direction of the character 
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)


func end_attack():
	attacking = false


func push(direction, speed):
	if (hp > 0):
		push_counter = 10
		velocity = direction * speed


func damage(val):
	if (push_counter == 0 and hp > 0):
		hp -= val
		if (hp < 0):
			hp = 0
		emit_signal("update_hp_count")


func perish():
	emit_signal("game_over")


func add_item(item_name):
	if (inventory.has(item_name)):
		inventory[item_name] += 1
	else:
		inventory[item_name] = 1
	emit_signal("update_inventory")


func _on_WeaponHitbox_body_entered(body):
	var pos = $"Sprite/WeaponHitbox/Collider".position
	if pos.x != 0 && sprite.scale.x > 0:
		body.push(Vector2(1, 0), speed * 3)
	elif pos.x != 0 && sprite.scale.x < 0:
		body.push(Vector2(-1, 0), speed * 3)
	elif pos.y > 0:
		body.push(Vector2(0, 1), speed * 3)
	elif pos.y < 0:
		body.push(Vector2(0, -1), speed * 3)
	body.damage(10)


func _on_WeaponHitbox_area_entered(area):
	area.queue_free()


func _on_InteractZone_body_entered(body):
	body.interact()


func _on_InteractZone_area_entered(area):
	if (in_classroom):
		music.stream = BABY_RAGE
		music.stream.loop_offset = 2.5
		in_classroom = false
	else:
		music.stream = SOSPARKLY
		music.stream.loop_offset = 0
		in_classroom = true
	music.play()

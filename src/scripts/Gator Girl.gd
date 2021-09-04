extends KinematicBody2D


var velocity = Vector2.ZERO
var speed = 600
var move_direction = Vector2.ZERO

onready var anim_player = $AnimationPlayer
onready var sprite = $Sprite

func _physics_process(delta):
	var move_direction = get_direction()
	if (move_direction.x != 0):
		anim_player.play("left_walk")
		sprite.scale.x = -move_direction.x
	elif (move_direction.y < 0):
		anim_player.play("back_walk")
	elif (move_direction.y > 0):
		anim_player.play("forward_walk")
	velocity = move_direction.normalized() * speed
	velocity = move_and_slide(velocity)
	
func _input(event):
	if event.is_action_pressed("attack"):
		var mouse_pos = get_viewport().get_mouse_position();
		var xdis = mouse_pos.x - 520
		var ydis = mouse_pos.y - 300
		if (abs(xdis) > abs(ydis)):
			anim_player.play("left_attack")
			if (xdis > 0):
				sprite.scale.x = -1
			else:
				sprite.scale.x = 1
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


func _on_WeaponHitbox_body_entered(body):
	body.queue_free()

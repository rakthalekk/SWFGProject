extends "res://src/scripts/StateMachine.gd"

func _ready():
	add_state("idle")
	add_state("run")
	add_state("attack")
	call_deferred("set_state", states.idle)

func _input(event):
	if event.is_action_pressed("attack"):
		set_state(states.attack)
		var mouse_pos = get_viewport().get_mouse_position();
		var xdis = mouse_pos.x - 520
		var ydis = mouse_pos.y - 300
		if (abs(xdis) > abs(ydis)):
			parent.anim_player.play("left_attack")
			if (xdis > 0):
				parent.sprite.scale.x = -1
			else:
				parent.sprite.scale.x = 1
		else:
			if (ydis > 0):
				parent.anim_player.play("forward_attack")
			else:
				parent.anim_player.play("back_attack")


func _state_logic(delta):
	parent.handle_movement(delta)
	print(parent.move_direction)
	if (state == states.run):
		if (parent.move_direction.x != 0):
			parent.anim_player.play("left_walk")
			parent.sprite.scale.x = -parent.move_direction.x
		elif (parent.move_direction.y < 0):
			parent.anim_player.play("back_walk")
		elif (parent.move_direction.y > 0):
			parent.anim_player.play("forward_walk")


func _get_transition(delta):
	match state:
		states.idle:
			if parent.velocity != Vector2.ZERO:
				return states.run
		states.run:
			if parent.velocity == Vector2.ZERO:
				return states.idle
		states.attack:
			if parent.velocity == Vector2.ZERO:
				return states.idle
			else:
				return states.run
	return null


func _enter_state(new_state, old_state):
	match new_state:
		states.idle:
			parent.anim_player.play("forward_walk")
		states.run:
			if (parent.move_direction.x != 0):
				parent.anim_player.play("left_walk")
				parent.sprite.scale.x = -parent.move_direction.x
			elif (parent.move_direction.y < 0):
				parent.anim_player.play("back_walk")
			elif (parent.move_direction.y > 0):
				parent.anim_player.play("forward_walk")

func _exit_state(old_state, new_state):
	pass

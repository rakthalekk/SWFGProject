extends Node2D

const end_screen = preload("res://src/scenes/EndScreen.tscn")

var level = 1


func _on_Gator_Girl_game_over(did_win):
	var screen = end_screen.instance()
	get_parent().add_child(screen)
	if (did_win):
		screen.set_win()
	queue_free()

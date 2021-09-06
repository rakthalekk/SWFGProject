extends Node2D

const end_screen = preload("res://src/scenes/EndScreen.tscn")

var level = 1

onready var music = $"/root/Music/AudioStreamPlayer"

func _on_Gator_Girl_game_over(did_win):
	music.stop()
	var screen = end_screen.instance()
	if (did_win):
		screen.set_win()
	get_parent().add_child(screen)
	queue_free()

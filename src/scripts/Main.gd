extends Node2D

const end_screen = preload("res://src/scenes/EndScreen.tscn")

var level = 1


func _on_Gator_Girl_game_over():
	get_parent().add_child(end_screen.instance())
	queue_free()

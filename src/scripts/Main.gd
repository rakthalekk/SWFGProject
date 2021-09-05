extends Node2D

const ITEM = preload("res://src/scenes/item.tscn")

func _on_Enemy_drop_item(pos):
	print("yeah")
	var it = ITEM.instance()
	it.position = pos

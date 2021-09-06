extends Area2D

const PABLO = preload("res://src/scenes/Pablo.tscn")
const HEIDI = preload("res://src/scenes/Heidi.tscn")
const DAISY = preload("res://src/scenes/Daisy.tscn")

onready var timer = $Timer

func _ready():
	timer.start(rand_range(15, 30))


func _on_Timer_timeout():
	match(randi()%3 + 1):
		1:
			spawn(PABLO)
		2:
			spawn(HEIDI)
		3:
			spawn(DAISY)


func spawn(enemy_type):
	var enemy = enemy_type.instance()
	enemy.position = position
	get_parent().add_child(enemy)
	$SpawnNoise.play()
	timer.start(rand_range(15, 30))

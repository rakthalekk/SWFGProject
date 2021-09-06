extends Area2D

const PABLO = preload("res://src/scenes/Pablo.tscn")
const HEIDI = preload("res://src/scenes/Heidi.tscn")
const DAISY = preload("res://src/scenes/Daisy.tscn")

onready var timer = $Timer
onready var anim_player = $AnimationPlayer

func _ready():
	timer.start(rand_range(15, 30))
	anim_player.play("door_closed")


func _on_Timer_timeout():
	anim_player.play("door_open")

func spawn():
	var enemy_type
	match(randi()%3 + 1):
		1:
			enemy_type = PABLO
		2:
			enemy_type = HEIDI
		3:
			enemy_type = DAISY
	var enemy = enemy_type.instance()
	enemy.position = position
	get_parent().add_child(enemy)
	$SpawnNoise.play()
	timer.start(rand_range(15, 30))
	anim_player.play("door_closed")

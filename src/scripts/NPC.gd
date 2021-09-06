class_name NPC
extends KinematicBody2D

const BUBBLE = preload("res://src/scenes/Speech.tscn")

var next_bubble = false
var bubbling_moment = false
var bubble_count = 1
var bubble_offset = Vector2(1500, 0)

onready var player = get_parent().get_node("Gator Girl")
onready var anim_player = $AnimationPlayer


func interact():
	if (!bubbling_moment):
		next_bubble = true


func create_bubble(text, next_in_queue, timer = false):
	if (timer):
		print("hello")
		var t = Timer.new()
		t.set_wait_time(2)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
	var bubble = BUBBLE.instance()
	bubble.bubble_text = text
	bubble.next_in_queue = next_in_queue
	bubble.position = position + bubble_offset
	call_deferred("add_child", bubble)


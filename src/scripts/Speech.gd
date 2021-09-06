extends Node2D

var bubble_text = "hello my name is ralph"
var bubble_text_len = 0
var bubble_text_index = 0
var current_text = ""
var next_in_queue = false

onready var label_text = get_node("VBoxContainer/Label")
onready var timer = get_node("Timer")

var do_close = false

# Called when the node enters the scene tree for the first time.
func _ready():
	bubble_text_len = bubble_text.length()
	timer.start(1)
	get_parent().bubbling_moment = true


func _on_Timer_timeout():
	if(!do_close):
		current_text += bubble_text[bubble_text_index]
		label_text.text = current_text
		
		if (bubble_text_index < bubble_text_len - 1):
			timer.start(0.02)
			bubble_text_index += 1
		else:
			if(!do_close):
				do_close = true
				timer.start(1)
	else:
		if (next_in_queue):
			get_parent().next_bubble = true
		else:
			get_parent().bubbling_moment = false
		queue_free()

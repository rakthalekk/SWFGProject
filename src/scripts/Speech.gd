extends Node2D

var bubble_text = "hello my name is ralph"
var can_shrink = true
var bubble_text_len = 0
var bubble_text_index = 0
var current_text = ""

onready var label_text = get_node("VBoxContainer/Label")
onready var nine_rect = get_node("VBoxContainer/Label/NinePatchRect")
onready var timer = get_node("Timer")

var do_close = false

# Called when the node enters the scene tree for the first time.
func _ready():
	bubble_text_len = bubble_text.length()
	timer.start(1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	if(!do_close):
		current_text += bubble_text[bubble_text_index]
		label_text.text = current_text
		
		if (bubble_text_index < bubble_text_len - 1):
			timer.start(0.04)
			bubble_text_index += 1
		else:
			if(!do_close):
				do_close = true
				timer.start(1)
	else:
		if(bubble_text_len > 0):
			current_text.erase(bubble_text_len - 1, 1)
			label_text.text = current_text
			bubble_text_len -= 1
			
			if(can_shrink):
				nine_rect.rect_size -= Vector2(30, 0)
				nine_rect.rect_position += Vector2(15, 0)
			
			timer.start(0.04)
		else:
			queue_free()
			
	pass # Replace with function body.

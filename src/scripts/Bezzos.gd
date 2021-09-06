extends NPC

const BUBBLE = preload("res://src/scenes/Speech.tscn")

var next_bubble = true
var bubbling_moment = false
var bubble_count = 1

func _ready():
	anim_player.play("bezzos_idle")


func _process(delta):
	if (next_bubble):
		next_bubble = false
		match bubble_count:
			1:
				create_bubble("Professor Cooking Papa: Hello! I’m so glad you\ntransferred to our wonderful school!", true)
			2:
				create_bubble("Unfortunately, Darcy over there contaminated all\nof our ingredients, so we can't start\nour internationally famous cooking class without some fresh ones.", true)
			3:
				create_bubble("If you would, could you go around the cafeteria and\nask some of our wonderful students if they\nhave some fresh ingredients?", true)
			4:
				create_bubble("I’ll give you some extra credit points if you do.", true)
			5:
				create_bubble("Could you collect 8 cheese, 4 pasta, and 4 bread for me?", false)
			6:
				create_bubble("That's not quite enough. I'll need 8 cheese, 4 pasta, and 4 bread.", false)
				bubble_count -= 1
		bubble_count += 1

func create_bubble(text, next_in_queue):
	var bubble = BUBBLE.instance()
	bubble.bubble_text = text
	bubble.next_in_queue = next_in_queue
	bubble.position = position + Vector2(1500, 0)
	call_deferred("add_child", bubble)


func interact():
	if (!bubbling_moment):
		next_bubble = true

extends NPC

func _ready():
	anim_player.play("bezzos_idle")


func _process(_delta):
	if (next_bubble):
		next_bubble = false
		match bubble_count:
			1:
				player.emit_signal("game_over", true)
				create_bubble("Professor Cooking Papa: Hello! I’m so glad you\ntransferred to our wonderful school!", true)
#			2:
#				create_bubble("Unfortunately, Darcy over there contaminated all\nof our ingredients, so we can't start\nour internationally famous cooking class without\nsome fresh ones.", true)
#			3:
#				create_bubble("If you would, could you go around the cafeteria and\nask some of our wonderful students if they\nhave some fresh ingredients?", true)
#			4:
#				create_bubble("I’ll give you some extra credit points if you do.", true)
#			5:
#				create_bubble("Could you collect 8 cheese, 4 pasta, and 4 bread for me?", false)
#			6:
#				if (!check_player_inventory()):
#					create_bubble("That's not quite enough. I'll need 6 cheese, 3 pasta, and 3 bread.", false)
#					bubble_count -= 1
#				else:
#					player.emit_signal("game_over", true)
		bubble_count += 1


func check_player_inventory():
	#if (player.inventory.has("cheese") && player.inventory.has("pasta") && player.inventory.has("bread")):
		#if (player.inventory.get("cheese") >= 6 && player.inventory.get("pasta") >= 3 && player.inventory.get("bread") >= 3):
			return true
	#return false

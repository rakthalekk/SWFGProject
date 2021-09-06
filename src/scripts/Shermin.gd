extends NPC


func _init():
	next_bubble = false
	bubble_offset = Vector2(2000, -1000)


func _ready():
	anim_player.play("shermin_idle")


func _process(_delta):
	if (next_bubble):
		next_bubble = false
		match bubble_count:
			1:
				create_bubble("Shermin: Yo, you, the weird gator kid, are you in\nthe market for some “special ingredients”?", true)
			2:
				create_bubble("I’ve got some MSG back in my locker. Makes every\ndish taste good even if you curb stomp it.", true)
			3:
				create_bubble("Look, if you don’t want anything I need you to go\naway, you’re making people look.", true, true)
			4:
				create_bubble("This school takes the quality of our ingredients\nsuper seriously, and they kick out anyone with anything\nremotely synthetic. Offers are always open though.", false)
			5:
				create_bubble("Everyone keeps asking me for the “green stuff”,\nbut I only deal in stuff I find in the local grocer\ndown the street from my house.", true)
			6:
				create_bubble("Please stop looking at me like that. I have to\nget lunch money somehow.", false, true)
			7:
				create_bubble("Dude please you’re freaking me out, buy something or eff off!", true)
			8:
				create_bubble("I can’t afford to get caught, this is the only\nschool in the area with a good rep, and my mom will kill\nme if we have to move again.", false)
			9:
				create_bubble("Sorry, that was a bit much.", false, true)
			10:
				create_bubble("Please buy something or move at least a few feet away from me.", false, false)
				bubble_count -= 1
		bubble_count += 1

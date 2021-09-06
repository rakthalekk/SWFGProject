extends NPC


func _init():
	next_bubble = false
	bubble_offset = Vector2(500, -950)


func _ready():
	anim_player.play("darcy_idle")


func _process(_delta):
	if (next_bubble):
		next_bubble = false
		match bubble_count:
			1:
				create_bubble("Darcy: Ah frick my bad", false)

extends NPC


func _ready():
	anim_player.play("darcy_idle")


func interact():
	queue_free()

extends NPC


func _ready():
	anim_player.play("shermin_idle")


func interact():
	queue_free()

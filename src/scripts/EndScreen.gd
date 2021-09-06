extends CanvasLayer

const GAME_OVER = preload("res://assets/Screens/failure.png")
const WIN_SCREEN = preload("res://assets/Screens/aplus.png")
const LOSE_SOUND = preload("res://assets/Sounds/u_succ_lol.wav")
const WIN_SOUND = preload("res://assets/Sounds/cat-sticker.wav")

export(String, FILE, "*.tscn") var menu

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_win():
	$Sprite.texture = WIN_SCREEN
	$AudioStreamPlayer.stream = WIN_SOUND

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_down():
	if ResourceLoader.exists(menu):
		var _error = get_tree().change_scene(menu)
	queue_free()

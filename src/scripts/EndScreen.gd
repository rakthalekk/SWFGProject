extends CanvasLayer

const menu = preload("res://src/scenes/Menu.tscn")
const GAME_OVER = preload("res://assets/Screens/failure.png")
const WIN_SCREEN = preload("res://assets/Screens/aplus.png")
const LOSE_SOUND = preload("res://assets/Sounds/u_succ_lol.wav")
const WIN_SOUND = preload("res://assets/Sounds/cat-sticker.wav")

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
	get_parent().add_child(menu.instance())
	queue_free()

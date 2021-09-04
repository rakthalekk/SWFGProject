extends KinematicBody2D


var velocity = Vector2.ZERO
var speed = 600

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	velocity = get_direction() * speed
	velocity = move_and_slide(velocity)


func get_direction(): #get direction of the character 
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).normalized()

class_name WordAttack
extends Area2D

const BALLS = preload("res://assets/Projectiles/balls.png")
const BESTIE = preload("res://assets/Projectiles/bestie.png")
const BRUH = preload("res://assets/Projectiles/bruh.png")
const CRANKING = preload("res://assets/Projectiles/cranking.png")
const DESERT = preload("res://assets/Projectiles/desert.png")
const LMAO = preload("res://assets/Projectiles/lmao.png")
const SOTRUE = preload("res://assets/Projectiles/sotrue.png")

var direction = Vector2.ZERO
var speed = 15
var lifespan = 300
var dmg = 5

onready var sprite = $Sprite
onready var anim_player = $AnimationPlayer

func _ready():
	match(randi()%7+1):
		1:
			sprite.texture = BALLS
		2:
			sprite.texture = BESTIE
		3:
			sprite.texture = BRUH
		4:
			sprite.texture = CRANKING
		5:
			sprite.texture = DESERT
		6:
			sprite.texture = LMAO
		7:
			sprite.texture = SOTRUE

func _physics_process(delta):
	anim_player.play("word_attack")
	if (lifespan <= 0):
		queue_free()
	position += direction * speed
	lifespan -= 1;


func _on_WordAttack_body_entered(body):
	if body is GatorGirl:
		body.damage(dmg)
		queue_free()


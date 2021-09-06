class_name Item
extends Area2D


const CARROT_TEX = preload("res://assets/items/fooditems/carrot.png")
const TOMATO_TEX = preload("res://assets/items/fooditems/tomato.png")
const PEPPER_TEX = preload("res://assets/items/fooditems/peppers.png")
const MUSHROOM_TEX = preload("res://assets/items/fooditems/muchrooms.png")
const CORN_TEX = preload("res://assets/items/fooditems/corn.png")
const LETTUCE_TEX = preload("res://assets/items/fooditems/lettuce.png")
const FLOUR_TEX = preload("res://assets/items/fooditems/flour.png")
const MILK_TEX = preload("res://assets/items/fooditems/bread.png") # milk == bread
const CHEESE_TEX = preload("res://assets/items/fooditems/cheese.png")
const BREAD_TEX = preload("res://assets/items/fooditems/bread.png")
const RICE_TEX = preload("res://assets/items/fooditems/rice.png")
const POTATO_TEX = preload("res://assets/items/fooditems/potato.png")
const PASTA_TEX = preload("res://assets/items/fooditems/pasta.png")
const EGG_TEX = preload("res://assets/items/fooditems/egg.png")
const SUGAR_TEX = preload("res://assets/items/fooditems/sugar.png")
const BUTTER_TEX = preload("res://assets/items/fooditems/butter.png")
const OIL_TEX = preload("res://assets/items/fooditems/oil.png")
const BEEF_TEX = preload("res://assets/items/fooditems/beef.png")
const PORK_TEX = preload("res://assets/items/fooditems/pork.png")
const CHICKEN_TEX = preload("res://assets/items/fooditems/chicken.png")
const FISH_TEX = preload("res://assets/items/fooditems/fish.png")


export var item_name = "bread"

var vegetables = ["carrot", "tomato", "pepper", "mushroom", "corn", "lettuce"]
var foundational = ["flour", "milk", "cheese", "bread", "rice", "potato", "pasta", "egg"]
var flavor_enhancer = ["sugar", "butter", "oil"]
var meat = ["beef", "pork", "chicken", "fish"]
var ingredients = ["carrot", "tomato", "pepper", "mushroom", "corn", "lettuce",
"flour", "milk", "cheese", "bread", "rice", "potato", "pasta", "egg",
"sugar", "butter", "oil", "beef", "pork", "chicken", "fish"]

var slash_weapons = ["spatula", "ladle", "ruler", "eggplant"]
var stab_weapons = ["spoon", "fork", "tongs", "french fry", "chopsticks"]
var throwables = ["chicken nugget"]
var weapons = [slash_weapons + stab_weapons + throwables]

onready var sprite = $Sprite

func _ready():
	get_random_ingredient()
	match_item_sprite()


func match_item_sprite():
	match (item_name):
		"carrot":
			sprite.texture = CARROT_TEX
		"tomato":
			sprite.texture = TOMATO_TEX
		"pepper":
			sprite.texture = PEPPER_TEX
		"mushroom":
			sprite.texture = MUSHROOM_TEX
		"corn":
			sprite.texture = CORN_TEX
		"lettuce":
			sprite.texture = LETTUCE_TEX
		"flour":
			sprite.texture = FLOUR_TEX
		"milk":
			sprite.texture = MILK_TEX
		"cheese":
			sprite.texture = CHEESE_TEX
		"bread":
			sprite.texture = BREAD_TEX
		"rice":
			sprite.texture = RICE_TEX
		"potato":
			sprite.texture = POTATO_TEX
		"pasta":
			sprite.texture = PASTA_TEX
		"egg":
			sprite.texture = EGG_TEX
		"sugar":
			sprite.texture = SUGAR_TEX
		"butter":
			sprite.texture = BUTTER_TEX
		"oil":
			sprite.texture = OIL_TEX
		"beef":
			sprite.texture = BEEF_TEX
		"pork":
			sprite.texture = PORK_TEX
		"chicken":
			sprite.texture = CHICKEN_TEX
		"fish":
			sprite.texture = FISH_TEX
		_:
			sprite.texture = BREAD_TEX


func get_random_ingredient():
	var ingredient_pool
	match get_parent().level:
		1:
			ingredient_pool = ["bread", "cheese", "cheese", "pasta"]
		_:
			ingredient_pool = ingredients
	item_name = ingredient_pool[randi() % ingredient_pool.size()]

func _on_item_hitbox_body_entered(body):
	if body is GatorGirl:
		body.add_item(item_name)
		body.hp += 5
		body.emit_signal("update_hp_count")
		body.play_pickup_sound()
		queue_free() #once collision is detected, remove item.

extends Area2D

export var item_name = "bread"

var vegetables = ["bread", "carrot", "tomato", "pepper", "mushroom", "corn", "spinach"]
var foundational = ["flour", "milk", "cheese", "bread", "rice", "potato", "pasta", "egg"]
var flavor_enhancer = ["sugar", "butter", "oil"]
var meat = ["beef", "pork", "chicken", "fish"]
var ingredients = [vegetables, foundational, flavor_enhancer, meat]

var slash_weapons = ["spatula", "ladle", "ruler", "eggplant"]
var stab_weapons = ["spoon", "fork", "tongs", "french fry", "chopsticks"]
var throwables = ["chicken nugget"]
var weapons = [slash_weapons, stab_weapons, throwables]

func _on_item_hitbox_body_entered(body):
	queue_free() #once collision is detected, remove item.

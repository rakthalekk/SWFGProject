extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$HP.text = "HP: " + String($"../Gator Girl".hp)


func _on_Gator_Girl_update_hp_count():
	$HP.text = "HP: " + String($"../Gator Girl".hp)


func _on_Gator_Girl_update_inventory():
	$Inventory.text = "Inventory: " + String($"../Gator Girl".inventory)

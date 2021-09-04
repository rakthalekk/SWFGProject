extends Area2D

func _on_item_hitbox_body_entered(body):
	queue_free() #once collision is detected, remove item.

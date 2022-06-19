extends Area2D

onready var dialogue = get_tree().get_root().get_node("Dialogue")

func _input(event):
	# change to target scene if input recieved and a body overlapping
	if event.is_action_pressed("ui_select") and get_overlapping_bodies().size():
		$Sprite.visible=false
		$StaticBody2D/CollisionShape2D.disabled = true
		$CollisionPolygon2D.disabled = true
		GlobalVariables.item_obtained = true 
		dialogue.queue_text("You picked up Alicia's book.")

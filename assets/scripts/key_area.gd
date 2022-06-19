extends Area2D

onready var dialogue = get_tree().get_root().get_node("Dialogue")

func _input(event):
	# change to target scene if input recieved and a body overlapping
	if event.is_action_pressed("ui_select") and get_overlapping_bodies().size():
		$Sprite.visible=false
		$CollisionShape2D.disabled = true
		GlobalVariables.key_obtained = true 
		dialogue.queue_text("Key obtained.")

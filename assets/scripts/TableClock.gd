extends Area2D

onready var dialogue = get_tree().get_root().get_node("Dialogue")

func _input(event):
	# presents dialogue box if input recieved and a body overlapping
	if event.is_action_pressed("ui_select") and get_overlapping_bodies().size(): 
		dialogue.queue_text("It seems the clock is broken. The longer hand is on 9 and the shorter nearly 4.")

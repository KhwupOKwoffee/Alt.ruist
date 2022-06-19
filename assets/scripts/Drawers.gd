extends Area2D

onready var dialogue = get_tree().get_root().get_node("Dialogue")
onready var input = get_tree().get_root().get_node("Dialogue/InputContainer/InnerContainer/LineEdit")

func _input(event):
	# present dialogue box if input recieved and a body overlapping
	if event.is_action_pressed("ui_select") and get_overlapping_bodies().size():
		input.queue_input("1545")
		dialogue.queue_text("The drawer is locked by a padlock.")
		dialogue.queue_text("Try to find a 4 digit code somewhere.")

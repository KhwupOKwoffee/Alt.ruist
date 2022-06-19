extends Area2D

onready var dialogue = get_tree().get_root().get_node("Dialogue")

func _input(event):
	if event.is_action_pressed("ui_select") and get_overlapping_bodies().size() and GlobalVariables.key_obtained:
		dialogue.queue_text("You use the key to unlock the door")
		$Sprite.visible = false
		$StaticBody2D/CollisionShape2D.disabled = true

extends Area2D

onready var dialogue=get_tree().get_root().get_node("Dialogue")

func _input(event):
	if event.is_action_pressed("ui_select") and get_overlapping_bodies().size() and GlobalVariables.item_obtained:
		dialogue.queue_text("PLAYER: I got the book.")
		dialogue.queue_text("ALICIA: Good, now read it and you won't have to ask me irritating questions.")
		dialogue.queue_text("She turned so quickly, you wonder made her so on edge.")
	elif event.is_action_pressed("ui_select") and get_overlapping_bodies().size():
		dialogue.queue_text("???: Um, hi. My name is Alicia.")
		dialogue.queue_text("PLAYER: Hi Alicia.")
		dialogue.queue_text("ALICIA: Say, have you ever read Galaxy Battles by George Frankland?")
		dialogue.queue_text("PLAYER: I, uh, can't say I have. What's it about?")
		dialogue.queue_text("ALICIA: Well, it's sort of in the name: battles in the galaxy.")
		dialogue.queue_text("PLAYER: Who's battling?")
		dialogue.queue_text("ALICIA: You're asking too many questions. Go get my book and stop annoying me.")
		dialogue.queue_text("ALICIA: It's in the blue building over there. Hurry up.")
		dialogue.queue_text("PLAYER: Ok, sorry, I'll go and get it.")

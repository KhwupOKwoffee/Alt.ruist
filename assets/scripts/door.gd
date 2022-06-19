extends Area2D

# set a scene target as a script var
export(String, FILE, "*.tscn, *.scn") var target

func _input(event):
	
	# change to target scene if input recieved and a body overlapping
	if event.is_action_pressed("ui_select") and get_overlapping_bodies().size():
			get_tree().change_scene(target)

extends LineEdit

var desired_input = "0"
var text_queue = []
var current_state = state.READY

enum state {
	READY,
	TYPING,
}

func _ready():
	print("start state.READY")
	hide_input()

func display_input(desired):
	desired_input = desired 
	get_node("/root/Dialogue/InputContainer").visible=true
	change_state(state.TYPING)
	
func hide_input():
	get_node("/root/Dialogue/InputContainer").visible=false

func queue_input(next_text):
	text_queue.push_back(next_text)
	
func _process(delta):
	match current_state:
		state.READY:
			if !text_queue.empty():
				display_input(text_queue.pop_front())
		state.TYPING:
				if Input.is_action_just_released("ui_focus_next"):
					hide_input()
					if text == desired_input:
						Dialogue.queue_text("The padlock springs open, allowing you to open the drawer.")
						Dialogue.queue_text("Inside there is a key, which you take.")
						GlobalVariables.key_obtained = true
					else:
						Dialogue.queue_text("Nothing happens.")
						text=""
					change_state(state.READY)

func change_state(next_state):
	current_state = next_state
	match current_state:
		state.READY:
			print("Changing to READY")
		state.TYPING:
			print("Changing to READING")
		state.FINISHED:
			print("Changing to FINISHED")

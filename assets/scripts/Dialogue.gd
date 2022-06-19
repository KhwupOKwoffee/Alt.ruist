extends CanvasLayer

const CHAR_READ_RATE = 0.05

onready var textbox_cointainer = get_node("CanvasLayer/TexboxContainer")
onready var label = get_node("CanvasLayer/TexboxContainer/MarginContainer/HBoxContainer/Label")

enum state { 
	READY, 
	READING,
	FINISHED
}
var current_state=state.READY 
var text_queue = []

func _process(delta):
	match current_state:
		state.READY:
			if !text_queue.empty():
				display_text()
		state.READING:
			if Input.is_action_just_pressed("ui_accept"):
				label.percent_visible= 1.0
				$Tween.stop_all()
				change_state(state.FINISHED)
		state.FINISHED:
			if Input.is_action_just_pressed("ui_accept"):
				change_state(state.READY)
				hide_textbox()

func queue_text(next_text):
	text_queue.push_back(next_text)

func _ready():
	hide_textbox()
	
func hide_textbox():
	label.text=""
	textbox_cointainer.hide()
	
func show_textbox():
	label.text="idk"
	textbox_cointainer.show()

func display_text():
	var next_text=text_queue.pop_front()
	label.text=next_text
	change_state(state.READING)
	textbox_cointainer.show()
	label.percent_visible = 0.0
	$Tween.interpolate_property(label,"percent_visible",0.0,1.0,len(next_text)*CHAR_READ_RATE,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$Tween.start()
	
func change_state(next_state):
	current_state = next_state
	match current_state:
		state.READY:
			pass
		state.READING:
			pass
		state.FINISHED:
			pass

func _on_Tween_tween_all_completed():
	change_state(state.FINISHED)
	

extends KinematicBody2D

# movement constants
const ACCELERATION = 512
const FRICTION = 512
const MAX_SPEED = 128

var velocity = Vector2.ZERO

# animation variables
onready var animation_tree = $animation_tree
onready var animation_state = animation_tree.get("parameters/playback")

func _physics_process(delta):
	
	# take user input as a vector
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector == Vector2.ZERO:
		
		# play idle animation and set not to move
		animation_state.travel("idle")
		velocity = velocity.move_toward(Vector2.ZERO, delta * FRICTION)
		
	else:
		
		# set animation blend positions to the input vector
		animation_tree.set("parameters/idle/blend_position", input_vector)
		animation_tree.set("parameters/run/blend_position", input_vector)
		
		# play run animation and set to move
		animation_state.travel("run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, delta * ACCELERATION)
	
	# move
	move_and_slide(velocity)

extends CharacterABC

const MAX_SPEED = 150.00
const FRICTION = 500.00
const DIR_4 = ["Left","Up","Right","Down"]

@onready var animation = $AnimationPlayer

var last_anim_timestamp = 0.0
var initial_position = Vector2.ZERO
var input_vector = Vector2.ZERO
var is_moving = false
var percent_moved_to_tile = 0

func _physics_process(delta):

	var input_vector = Vector2.ZERO
	last_anim_timestamp = animation.current_animation_position
	if Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_down"):
		if Input.is_action_pressed("ui_up"):
			animation.play("Run_Up")
		else:
			animation.play("Run_Down")
		animation.seek(last_anim_timestamp)
		input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		input_vector.x = 0
	elif Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right"):
		if Input.is_action_pressed("ui_left"):
			animation.play("Run_Left")
		else:
			animation.play("Run_Right")
		animation.seek(last_anim_timestamp)
		input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vector.y - 0
	else:
		animation.play("Idle_Down")
	input_vector = input_vector.normalized()
	
	if DialogueManager.is_dialog_active != true:
		if input_vector != Vector2.ZERO:
			velocity = input_vector * MAX_SPEED
		else:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	else:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
			animation.pause()

	move_and_slide()
	

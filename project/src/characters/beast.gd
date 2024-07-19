extends CharacterABC

const MAX_SPEED = 500.00
const FRICTION = 200.00


func _physics_process(delta):

	var input_vector = Vector2.ZERO

	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		velocity = input_vector * MAX_SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)

	move_and_slide()

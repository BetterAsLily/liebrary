extends CharacterABC
class_name Player

const MAX_SPEED = 150.00
const FRICTION = 20
const DIR_4 = ["left","up","right","down"]

@onready var animation = $AnimationPlayer

var last_anim_timestamp = 0.0
var initial_position = Vector2.ZERO
var input_vector = Vector2.ZERO
var is_moving = false
var percent_moved_to_tile = 0
var direction = ""
func _physics_process(delta):
	for direction in DIR_4:
		if Input.is_action_just_released("ui_"+ direction):
			var index = MovementManager.direction_history.find(direction)
			if index != -1:
				MovementManager.direction_history.remove_at(index)
		if Input.is_action_just_pressed("ui_"+ direction):
			MovementManager.direction_history.append(direction)
	if MovementManager.direction_history.size():
			direction = MovementManager.direction_history[MovementManager.direction_history.size()-1]
	else:
		direction = "idle"
	
	if DialogueManager.is_dialog_active != true && GlobalVariables.game_state == "running":
		var input_vector = Vector2.ZERO
		last_anim_timestamp = animation.current_animation_position
		if direction == "up" || direction == "down":
			if direction == "up":
				animation.play("run_up")
				input_vector.y = 0 - Input.get_action_strength("ui_up")
			else:
				animation.play("run_down")
				input_vector.y = Input.get_action_strength("ui_down")
			animation.seek(last_anim_timestamp)
			input_vector.x = 0
		elif direction == "left" || direction == "right":
			if direction == "left":
				animation.play("run_left")
				input_vector.x = 0 - Input.get_action_strength("ui_left")
			else:
				animation.play("run_right")
				input_vector.x = Input.get_action_strength("ui_right")
			animation.seek(last_anim_timestamp)
			input_vector.y - 0
		elif direction == "idle":
			animation.play("idle_down")
		input_vector = input_vector.normalized()
		if input_vector != Vector2.ZERO:
			velocity = input_vector * MAX_SPEED
		else:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
			MovementManager.direction_history = []
	elif GlobalVariables.game_state == "paused":
			animation.play("idle_down")
	else:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
			animation.pause()

	move_and_slide()
	

extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GlobalVariables.is_first_load:
		print("how")
		get_tree().paused = true
		GlobalVariables.game_state = "paused"

func _on_start_pressed() -> void:
	get_tree().paused = false
	GlobalVariables.game_state = "running"
	get_parent().remove_child(self)
	GlobalVariables.is_first_load = false

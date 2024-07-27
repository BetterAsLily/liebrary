extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true

func _on_start_pressed() -> void:
	get_tree().paused = false
	get_parent().remove_child(self)

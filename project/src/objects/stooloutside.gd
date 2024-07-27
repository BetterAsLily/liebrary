extends Node2D

@onready var interaction_area = $InteractionArea

const letterwords: Array[String] = ["This Stool is a House"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_read_letter")


func _read_letter():
	get_tree().change_scene_to_file("res://src/levels/Zone 1.tscn")

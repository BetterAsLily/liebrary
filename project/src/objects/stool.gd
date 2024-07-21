extends Node2D

@onready var interaction_area = $InteractionArea


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_read_letter")


func _read_letter():
	print("Wassup Baby Girl")

extends BaseScene
@onready var start_button = preload("res://src/ui/menu.tscn")
@onready var canvas = $CanvasLayer

func _ready():
	super()
	if GlobalVariables.is_first_load == true:
		var new_button = start_button.instantiate()
		canvas.add_child(new_button)
		new_button.global_position = Vector2(80,300)
		new_button.z_index = 10
	

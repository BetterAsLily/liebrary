extends BaseScene
@onready var start_button = preload("res://src/ui/menu.tscn")

func _ready():
	super()
	if GlobalVariables.is_first_load == true:
		var new_button = start_button.instantiate()
		self.add_child(new_button)
		new_button.global_position = Vector2(80,300)
	

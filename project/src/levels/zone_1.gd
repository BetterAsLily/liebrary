extends BaseScene

@onready var camera = $Camera2D

func _ready():
	super()
	camera.follow_node = player
func _process(delta: float) -> void:
	pass
	


func _on_scene_trigger_2_body_entered(body: Node2D) -> void:
	pass # Replace with function body.

extends BaseScene

@onready var camera = $Camera2D
@onready var sound = $AudioStreamPlayer

func _ready():
	super()
	camera.follow_node = player
	
func _process(delta: float) -> void:
	print("plip")
	if sound.playing == false:
		sound.play()
		print("plop")

class_name BaseScene
extends Node

@onready var player: Player = $Player
@onready var entrance_markers: Node2D = $EntranceMarkers

func _ready() -> void:
	if SceneManager.player:
		if player:
			player.queue_free()
		player = SceneManager.player
	self.add_child(player)
	
	position_player()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func position_player():
	var last_scene = SceneManager.last_scene_name
	if last_scene.is_empty():
		last_scene = "any"
	for entrance in entrance_markers.get_children():
		if entrance.name == last_scene:
			player.global_position = entrance.global_position

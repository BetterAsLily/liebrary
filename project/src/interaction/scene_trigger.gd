extends Area2D
class_name SceneTrigger

@export var connected_scene: String
var scene_folder = "res://src/levels/"

func _on_body_entered(body: Player):
	SceneManager.change_scene(get_owner(), connected_scene)

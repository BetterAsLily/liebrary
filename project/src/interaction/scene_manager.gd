extends Node

var player: Player
var last_scene_name: String

var scene_dir_path = "res://src/levels/"
var player_index = []
func change_scene(from, to_scene_name: String):
	last_scene_name = from.name
	player_index = from.find_children("","Player",true,false)
	player = player_index[0]

	player.get_parent().remove_child(player)
	
	var full_path = scene_dir_path + to_scene_name + ".tscn"
	from.get_tree().call_deferred("change_scene_to_file", full_path)
	
	
	


extends Node2D

class Cauldron:
	var step_history = []
	var history_len = 10

	func add_to_queue(item):
		if len(step_history) < history_len:
			step_history.append(item)
		else:
			step_history.pop_front()
			step_history.append(item)

	func has_recipe(recipe) -> bool:
		var found = false
		for i in range(history_len):
			var subhistory = step_history.slice(i, i + len(recipe))
			found = found || (subhistory == recipe)
		return found

	func handle_step(event: InputEventKey):
		add_to_queue(event.keycode)
		for recipe in cookbook.all_potions:
			if has_recipe(recipe):
				print("Cooked a recipe")

var c = Cauldron.new()

# Basic input parsing
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_W or event.keycode == KEY_A \
		or event.keycode == KEY_S or event.keycode == KEY_D:
			c.handle_step(event)

extends Node2D

@onready var hist = $History
@onready var audio_stream = $AudioStreamPlayer
@onready var enemy_sprite = $PlaceholderEnemy2

var enemy_health = 3

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
		for recipe in Cookbook.all_potions:
			if has_recipe(recipe):
				step_history = []
				return recipe
		return []

var c = Cauldron.new()

# Basic input parsing
func _input(event):
	var temp = []
	var strhold = ""
	var brewed = []
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_W:
			brewed = c.handle_step(event)
			audio_stream.stream = load("res://assets/Audio/Pot1.wav")
			audio_stream.play()
		elif event.keycode == KEY_A:
			brewed = c.handle_step(event)
			audio_stream.stream = load("res://assets/Audio/Pot2.wav")
			audio_stream.play()
		elif event.keycode == KEY_S:
			brewed = c.handle_step(event)
			audio_stream.stream = load("res://assets/Audio/Pot3.wav")
			audio_stream.play()
		elif event.keycode == KEY_D:
			brewed = c.handle_step(event)
			audio_stream.stream = load("res://assets/Audio/Pot1.wav")
			audio_stream.play()
		
		if brewed == Cookbook.basic_potion:
			print("Basic Potion!")
			enemy_health -= 1
			if enemy_health <= 0:
				enemy_sprite.visible = false
		brewed = []
		
		print(c.step_history)
		for item in c.step_history:
			if item == KEY_W:
				strhold += "↑"
			elif item == KEY_A:
				strhold += "←"
			elif item == KEY_S:
				strhold += "↓"
			elif item == KEY_D:
				strhold += "→"
		hist.text = str(strhold)
		strhold = ""
			

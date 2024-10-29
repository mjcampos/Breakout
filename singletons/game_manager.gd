extends Node

var current_scene: PackedScene

var game_started: bool = false:
	get:
		return game_started
	set(value):
		game_started = value

func start_new_round():
	game_started = false
	
	SignalManager.on_new_round.emit()

func reset_scene():
	get_tree().change_scene_to_packed(current_scene)
	ScoreManager.reset_points()
	LivesManager.reset_lives()

func set_current_scene(scene: PackedScene):
	current_scene = scene

extends Node

const GAME = preload("res://scenes/game/game.tscn")
const MAIN = preload("res://scenes/main/main.tscn")
const SETTINGS = preload("res://scenes/settings/settings.tscn")

var game_started: bool = false:
	get:
		return game_started
	set(value):
		game_started = value

var paddle_has_shrunk: bool = false

func start_new_round():
	game_started = false
	
	SignalManager.on_new_round.emit()

func reset_scene():
	get_tree().change_scene_to_packed(GAME)
	ScoreManager.reset_points()
	LivesManager.reset_lives()

func go_to_game():
	get_tree().change_scene_to_packed(GAME)

func go_to_main():
	game_started = false
	paddle_has_shrunk = false
	get_tree().change_scene_to_packed(MAIN)
	ScoreManager.reset_points()
	LivesManager.reset_lives()

func go_to_settings():
	get_tree().change_scene_to_packed(SETTINGS)

func ball_hit_roof():
	if not paddle_has_shrunk:
		SignalManager.on_ball_hit_roof.emit()
		paddle_has_shrunk = true

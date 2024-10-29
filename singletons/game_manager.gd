extends Node

const GAME = preload("res://scenes/game/game.tscn")
const MAIN = preload("res://scenes/main/main.tscn")

var game_started: bool = false:
	get:
		return game_started
	set(value):
		game_started = value

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
	get_tree().change_scene_to_packed(MAIN)
	ScoreManager.reset_points()
	LivesManager.reset_lives()

extends Node

var game_started: bool = false:
	get:
		return game_started
	set(value):
		game_started = value

func reset_game():
	game_started = false
	
	SignalManager.on_reset_position.emit()

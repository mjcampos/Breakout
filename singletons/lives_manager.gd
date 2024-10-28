extends Node

var lives: int = 3

func loose_life():
	lives -= 1
	SignalManager.on_life_lost_label_update.emit()

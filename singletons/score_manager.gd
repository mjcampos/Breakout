extends Node

var total_points: int = 0

func add_points(points: int):
	total_points += points
	SignalManager.on_point_label_update.emit()

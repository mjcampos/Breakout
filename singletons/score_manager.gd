extends Node

const SCORE_PATH = "user://breakout.dat"

var total_points: int = 0
var high_score: int = 0:
	get():
		return high_score

func add_points(points: int):
	total_points += points
	
	SignalManager.on_point_label_update.emit()

func reset_points():
	total_points = 0

func load_high_score():
	var file: FileAccess = FileAccess.open(SCORE_PATH, FileAccess.READ)
	
	if file:
		if file.get_length() > 0:
			high_score = file.get_32()
		else:
			print("Nothing in file")
			
		file.close()
	else:
		print("Failed to load file")

	SignalManager.on_high_score_loaded.emit()

func save_high_score_to_file():
	high_score = max(high_score, total_points)
	
	var file: FileAccess = FileAccess.open(SCORE_PATH, FileAccess.WRITE)
	
	if file:
		file.store_32(high_score)
		file.close()

func reset_high_score():
	high_score = 0
	save_high_score_to_file()

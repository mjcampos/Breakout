extends Node2D

@onready var point_label = $"labels/Point Label"
@onready var lives_label = $"labels/Lives Label"

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_point_label_update.connect(update_score_display)
	SignalManager.on_life_lost_label_update.connect(update_lives_display)
	
	point_label.text = str(ScoreManager.total_points)
	lives_label.text = str(LivesManager.lives)

func update_score_display():
	point_label.text = str(ScoreManager.total_points)

func update_lives_display():
	lives_label.text = str(LivesManager.lives)

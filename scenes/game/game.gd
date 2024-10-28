extends Node2D

@onready var point_label = $"labels/Point Label"
@onready var lives_label = $"labels/Lives Label"
@onready var explosion_sound = $ExplosionSound

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_point_label_update.connect(update_score_display)
	SignalManager.on_life_lost_label_update.connect(update_lives_display)
	SignalManager.on_explosion_triggered.connect(play_explosion_sound)
	
	point_label.text = str(ScoreManager.total_points)
	lives_label.text = str(LivesManager.lives)

func update_score_display():
	point_label.text = str(ScoreManager.total_points)

func update_lives_display():
	lives_label.text = str(LivesManager.lives)

func play_explosion_sound(explosion_loc: Vector2):
	explosion_sound.position = explosion_loc
	explosion_sound.play()

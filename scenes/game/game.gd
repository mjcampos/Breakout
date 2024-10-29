extends Node2D

@onready var explosion_sound = $ExplosionSound
@onready var timer = $Timer
@onready var point_label = $"Control/Point Label"
@onready var lives_label = $"Control/Lives Label"

var countdown: int = 3

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


func _on_timer_timeout():
	countdown -= 1
	
	if countdown > 0:
		print(countdown)
		timer.start()
	else:
		GameManager.toggle_game_start(true)

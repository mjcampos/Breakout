extends Node2D

@onready var explosion_sound = $ExplosionSound
@onready var timer = $Timer
@onready var point_label = $"UI/Point Label"
@onready var lives_label = $"UI/Lives Label"
@onready var countdown_label = $UI/CountdownLabel

var countdown: int

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_point_label_update.connect(update_score_display)
	SignalManager.on_life_lost_label_update.connect(update_lives_display)
	SignalManager.on_explosion_triggered.connect(play_explosion_sound)
	SignalManager.on_reset_position.connect(initiate_countdown)
	
	# Setup countdown display
	initiate_countdown()
	
	point_label.text = str(ScoreManager.total_points)
	lives_label.text = str(LivesManager.lives)

func initiate_countdown():
	countdown = 3
	countdown_label.text = str(countdown)
	countdown_label.visible = true
	timer.start()

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
		countdown_label.text = str(countdown)
		timer.start()
	else:
		countdown_label.visible = false
		GameManager.game_started = true

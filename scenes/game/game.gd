extends Node2D

@onready var explosion_sound = $ExplosionSound
@onready var timer = $Timer
@onready var point_label: Label = $"UI/Point Label"
@onready var lives_label: Label = $"UI/Lives Label"
@onready var countdown_label: Label = $UI/CountdownLabel
@onready var end_game_label: Label = $UI/EndGameLabel

var countdown: int

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_point_label_update.connect(update_score_display)
	SignalManager.on_life_lost_label_update.connect(update_lives_display)
	SignalManager.on_explosion_triggered.connect(play_explosion_sound)
	SignalManager.on_new_round.connect(initiate_countdown)
	SignalManager.on_game_over.connect(game_over)
	
	default_label_settings()
	initiate_countdown()

func default_label_settings():
	point_label.text = str(ScoreManager.total_points)
	lives_label.text = str(LivesManager.lives)
	
	point_label.visible = true
	lives_label.visible = true
	
	countdown_label.visible = false
	end_game_label.visible = false

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

func game_over():
	end_game_label.visible = true

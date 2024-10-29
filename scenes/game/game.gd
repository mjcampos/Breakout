extends Node2D

@onready var explosion_sound = $ExplosionSound
@onready var timer = $Timer
@onready var point_label: Label = $"UI/Point Label"
@onready var lives_label: Label = $"UI/Lives Label"
@onready var countdown_label: Label = $UI/CountdownLabel
@onready var brick_parent_node: Node2D = $Bricks
@onready var game_over_label: Label = $UI/GameOverLabel
@onready var player_won_label: Label = $UI/PlayerWonLabel

var countdown: int

# Called when the node enters the scene tree for the first time.
func _ready():
	# Setup signals
	SignalManager.on_point_label_update.connect(update_score_display)
	SignalManager.on_life_lost_label_update.connect(update_lives_display)
	SignalManager.on_explosion_triggered.connect(play_explosion_sound)
	SignalManager.on_new_round.connect(initiate_countdown)
	SignalManager.on_game_over.connect(game_over)
	SignalManager.on_player_won.connect(player_won)
	
	# As extra precaution, ensure game_started is set to false
	GameManager.game_started = false
	
	# Pass along the brick parent node to the Brick Manager singleton to count and track the number of visible bricks in the game
	BrickManager.count_bricks(brick_parent_node)
	
	# Set initial default settings for all labels
	default_label_settings()
	
	# Initiate the countdown to begin the scene
	initiate_countdown()

func _process(delta):
	if Input.is_action_just_pressed("exit"):
		GameManager.go_to_main()
			
	if not GameManager.game_started:
		if Input.is_action_just_pressed("reset"):
			GameManager.reset_scene()

func default_label_settings():
	point_label.text = str(ScoreManager.total_points)
	lives_label.text = str(LivesManager.lives)
	
	point_label.visible = true
	lives_label.visible = true
	
	countdown_label.visible = false
	game_over_label.visible = false
	player_won_label.visible = false

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
	game_over_label.text = "Game Over with a score of %d points!!!\n\nPress R to play again, or ESC to go back to the main menu." % ScoreManager.total_points
	game_over_label.visible = true

func player_won():
	player_won_label.visible = true

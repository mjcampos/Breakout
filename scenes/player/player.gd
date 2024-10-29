extends CharacterBody2D
class_name Player

@export var _speed: float = 400.0

var starting_position: Vector2

func _ready():
	SignalManager.on_new_round.connect(reset_player_position)
	starting_position = position

func _physics_process(_delta):
	if GameManager.game_started:
		var direction = Input.get_axis("ui_left", "ui_right")
		
		velocity.x = direction * _speed
		
		move_and_slide()
		
		position.y = starting_position.y

func reset_player_position():
	position = starting_position

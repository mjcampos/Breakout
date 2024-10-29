extends CharacterBody2D
class_name Player

@export var _speed: float = 400.0

var fixed_y_position: float

func _ready():
	fixed_y_position = position.y

func _physics_process(_delta):
	if GameManager.game_started:
		var direction = Input.get_axis("ui_left", "ui_right")
		
		velocity.x = direction * _speed
		
		move_and_slide()
		
		position.y = fixed_y_position

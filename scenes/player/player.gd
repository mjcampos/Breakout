extends CharacterBody2D
class_name Player
@export var _speed: float = 400.0
@onready var sprite_2d = $Sprite2D

var fixed_y_position: float

func _ready():
	fixed_y_position = position.y

func _physics_process(_delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	
	velocity.x = direction * _speed
	position.y = fixed_y_position
	
	move_and_slide()

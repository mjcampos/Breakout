extends CharacterBody2D

@export var _speed: float = 400.0
@onready var sprite_2d = $Sprite2D

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()

func _physics_process(_delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	
	velocity.x = direction * _speed
	
	move_and_slide()
	clamp_paddle_position()

func clamp_paddle_position():
	var width: float = sprite_2d.texture.get_width()
	
	position.x = clamp(position.x, width/2, get_viewport_rect().size.x - width/2)

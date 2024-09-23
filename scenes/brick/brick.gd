class_name Brick
extends StaticBody2D

@export var sprite2D_texture: Texture
@export var _points: int

@onready var sprite_2d = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_2d.texture = sprite2D_texture

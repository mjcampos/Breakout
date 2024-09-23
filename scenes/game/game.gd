class_name Game
extends Node2D

@export var _points: int = 0
@export var _lives: int = 3

@onready var point_label = $"labels/Point Label"
@onready var lives_label = $"labels/Lives Label"

# Called when the node enters the scene tree for the first time.
func _ready():
	point_label.text = str(_points)
	lives_label.text = str(_lives)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_points(gained_points: int):
	_points += gained_points
	point_label.text = str(_points)

func deduct_lives():
	_lives -= 1
	lives_label.text = str(_lives)

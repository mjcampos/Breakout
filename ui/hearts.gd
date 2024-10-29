extends HBoxContainer

const HEART: PackedScene = preload("res://ui/heart.tscn")

var hearts: int = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_hearts()


func generate_hearts():
	var heart = HEART.instantiate()
	
	heart.position = Vector2(110, 0)
	add_child(heart)

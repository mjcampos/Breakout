extends AudioStreamPlayer

const BACKGROUND_MUSIC = preload("res://assets/background_music.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	stream = BACKGROUND_MUSIC
	volume_db = -15
	play()

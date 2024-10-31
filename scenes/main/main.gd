extends Control

@onready var play_button: Button = $PlayButton
@onready var record_label: Label = $RecordLabel

func _ready():
	SignalManager.on_high_score_loaded.connect(update_high_score)
	
	Input.joy_connection_changed.connect(on_joy_connection_changed)
	
	if Input.is_joy_known(0):
		play_button.grab_focus()

	# Setup high score
	ScoreManager.load_high_score()
func _on_play_button_pressed():
	GameManager.go_to_game()

func remove_focus_from_all_buttons():
	for child in get_children():
		if child is Button:
			child.release_focus()

func on_joy_connection_changed(device: int, connected: bool):
	if connected:
		play_button.grab_focus()
	else:
		remove_focus_from_all_buttons()

func _on_settings_button_pressed():
	GameManager.go_to_settings()

func update_high_score():
	record_label.text = str(ScoreManager.high_score)

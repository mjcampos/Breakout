extends Control

@onready var play_button: Button = $PlayButton

func _ready():
	Input.joy_connection_changed.connect(on_joy_connection_changed)
	
	if Input.is_joy_known(0):
		play_button.grab_focus()

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

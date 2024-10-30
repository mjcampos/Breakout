extends Control

@onready var play_button: Button = $PlayButton

func _process(delta):
	if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
		play_button.grab_focus()

func _on_play_button_pressed():
	GameManager.go_to_game()

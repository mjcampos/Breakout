extends Control

@onready var reset_record_button: Button = $ResetRecordButton
@onready var back_button: Button = $BackButton

# Called when the node enters the scene tree for the first time.
func _ready():
	if Input.is_joy_known(0):
		reset_record_button.grab_focus()
	else:
		remove_focus_from_all_buttons()

func _on_back_button_pressed():
	GameManager.go_to_main()

func remove_focus_from_all_buttons():
	for child in get_children():
		if child is Button:
			child.release_focus()

func _on_reset_record_button_pressed():
	ScoreManager.reset_high_score()

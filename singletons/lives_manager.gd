extends Node

var lives: int = 3

func loose_life():
	lives -= 1
	SignalManager.on_life_lost_label_update.emit()
	
	if lives > 0:
		# Pause for a second to give the user a chance to realize that they lost a life
		await get_tree().create_timer(1.0).timeout
		
		# Call Game Manager to start the reset process
		GameManager.reset_game()
	else:
		# Freeze the gameplay
		GameManager.game_started = false
		
		# Alert the player that the game is over and how many points they won

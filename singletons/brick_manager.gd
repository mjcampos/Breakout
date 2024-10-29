extends Node

var bricks: int

func count_bricks(brick_parent_node: Node2D):
	bricks = 0  # Reset count  in case of re-initialization
	
	for brick in brick_parent_node.get_children():
		# Check if the brick is a Node2D and is visible
		if brick is Brick and brick.visible:
			bricks += 1

func deduct_brick():
	bricks -= 1
	
	if bricks < 1:
		# Pause for a second to give the user a chance to realize that they won
		await get_tree().create_timer(1.0).timeout
		
		# End game sequence
		GameManager.game_started = false
		SignalManager.on_player_won.emit()

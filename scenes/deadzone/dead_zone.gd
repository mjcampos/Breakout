extends Area2D

func _on_body_entered(body):
	LivesManager.loose_life()

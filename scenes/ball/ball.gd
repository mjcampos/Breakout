class_name Ball
extends CharacterBody2D

var speed = 500.0

# Called when the node enters the scene tree for the first time.
func _ready():
	var random_angle = randf() * 360
	
	velocity = Vector2(cos(random_angle), sin(random_angle)) * speed

func _physics_process(delta):
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		
		# If ball hits Brick trigger its destruction
		var collider: Object = collision.get_collider()
		
		if collider is Brick:
			collider.destroy_brick()
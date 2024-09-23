extends CharacterBody2D

var speed = 400.0

# Called when the node enters the scene tree for the first time.
func _ready():
	#velocity = Vector2(-200, -200).normalized() * speed
	var random_angle = randf() * 360
	
	velocity = Vector2(cos(random_angle), sin(random_angle)) * speed
	#velocity = -up_direction.normalized() * speed


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())

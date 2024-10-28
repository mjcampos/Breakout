extends CharacterBody2D

@onready var hit_audio = $HitAudio

var speed = 500.0
var starting_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_reset_position.connect(reset_ball_position)
	var random_angle = deg_to_rad(randf_range(20, 160))
	
	velocity = Vector2(cos(random_angle), -sin(random_angle)) * speed
	starting_position = position

func _physics_process(delta):
	if GameManager.game_started:
		var collision: KinematicCollision2D = move_and_collide(velocity * delta)
		
		if collision:
			velocity = velocity.bounce(collision.get_normal())
			
			# If ball hits Brick trigger its destruction
			var collider: Object = collision.get_collider()
			
			if collider is Brick:
				collider.destroy_brick()
			else:
				hit_audio.position = position
				hit_audio.play()

func reset_ball_position():
	position = starting_position

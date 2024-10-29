extends CharacterBody2D

@onready var hit_audio = $HitAudio
@onready var animated_sprite_2d = $AnimatedSprite2D

var initial_speed: int = 400.0
var starting_position: Vector2
var speed_increase_rate: float = 1.1

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_new_round.connect(reset_ball_position)
	
	set_random_velocity(initial_speed)
	
	starting_position = position
	animated_sprite_2d.play()

func _physics_process(delta):
	if GameManager.game_started:
		var collision: KinematicCollision2D = move_and_collide(velocity * delta)
		
		if collision:
			velocity = velocity.bounce(collision.get_normal())
			
			# If ball hits Brick trigger its destruction
			var collider: Object = collision.get_collider()
			
			if collider is Brick:
				collider.destroy_brick()
				velocity = velocity * speed_increase_rate
			else:
				hit_audio.position = position
				hit_audio.play()

func reset_ball_position():
	position = starting_position
	
	# Initiate new velocity
	var updated_speed = velocity.length()
	
	set_random_velocity(updated_speed)

func set_random_velocity(speed_input: float):
	var random_angle = deg_to_rad(randf_range(20, 160))
	
	velocity = Vector2(cos(random_angle), -sin(random_angle)) * speed_input

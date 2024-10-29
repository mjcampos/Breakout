extends HBoxContainer

@onready var heart: TextureRect = $Heart
@onready var heart_2: TextureRect = $Heart2
@onready var heart_3: TextureRect = $Heart3

var hearts_array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set hearts as invisible by default
	make_hearts_invisible()
	
	# Add them to the array
	hearts_array = [heart, heart_2, heart_3]

func generate_hearts(count: int):
	# Set all hearts as invisible for a fresh start
	make_hearts_invisible()
	
	var fixed_count = clampi(count, 0, 3)  # Ensure the amount of hears requested is never greater than 3, or less than 0
	var hearts_needed = hearts_array.slice(0, fixed_count)
	
	for heartI: TextureRect in hearts_needed:
		heartI.visible = true

func make_hearts_invisible():
	heart.visible = false
	heart_2.visible = false
	heart_3.visible = false

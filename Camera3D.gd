extends Camera3D

# Camera math varibales
const radius_change: int = 1
var radius: int = 13
var rotate_speed: float = 1.5
var theta: float 
var phi: float

# Board related variables
var board_height = 6
var look_at_vector: Vector3 = Vector3(0,1,0)
var board_level: int = 1

func _ready():
	theta = acos(position.y/radius) 
	phi = sign(position.z)*acos(position.x/sqrt(position.x * position.x + position.z * position.z))

func _process(delta):
	# Look at the center of the board at current height
	look_at(Vector3(0, board_level, 0), Vector3.UP)

	# Read input for rotation
	var direction = Input.get_vector("move_right", "move_left", "move_up", "move_down")
	theta += direction.y * rotate_speed * delta
	phi += direction.x * rotate_speed * delta
	position = radius * Vector3(sin(theta) * cos(phi), cos(theta) + float(board_level)/radius, sin(theta) * sin(phi))
	
	# Clamp vertical angle
	theta = clamp(theta, 0.2, PI * 0.55)
	
func _input(event):
	if event.is_action_pressed("zoom_in"):
		radius -= radius_change 
	if event.is_action_pressed("zoom_out"):
		radius += radius_change 
	if event.is_action_pressed("reset_camera"):
		#Default values
		radius = 13
		theta = PI/2
		phi = PI
		look_at_vector = Vector3(0,1,0)
		board_level = 1
		
	var board_actions = {
	"board1_display": board_height,
	"board2_display": 0,
	"board3_display": -board_height
	}

	for action_name in board_actions.keys():
		if event.is_action_pressed(action_name):
			var target_level = board_actions[action_name]
			board_level = target_level
			smooth(rotation)
	
	if event.is_action_pressed("drag"):
		pass
		#print(event.position)
		#print(event.relative)
		#look_at_vector = event.position
	
	radius = clamp(radius, 5, 25)
	
func smooth(init_rot):
	var last_rot = rotation
	look_at(Vector3.ZERO, Vector3.UP)
	var tween = create_tween()
	tween.tween_property(self, "rotation", last_rot, 1).from(init_rot)
	

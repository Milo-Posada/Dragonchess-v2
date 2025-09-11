extends Piece

@onready var mesh_node = $CollisionShape3D/Sylph

var move_dic = { # Row Level Col
	1: {1: Vector3(1,0,-1), #forward_left
		2: Vector3(1,0,1), #forward_right
		3: Vector3(1,0,0), #forward
		4: Vector3(0,-1,0), #down
	},
	2: {1: Vector3(0,0,0), #space1
		2: Vector3(0,0,0), #space2
		3: Vector3(0,0,0), #space3
		4: Vector3(0,0,0), #space4
		5: Vector3(0,0,0), #space5
		6: Vector3(0,0,0), #space6
		7: Vector3(0,1,0), #up
	},
}

# WORK
var move_dict2 = {
	"m": [
		Vector3(0, -1, 1),  # top-left relative
		Vector3(0, 1, 1)    # top-right relative
	],
	"x": [
		Vector3(0, -1, 1),
		Vector3(0, 1, 1)
	]
}

func _ready():
	mesh = mesh_node
	init_piece()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

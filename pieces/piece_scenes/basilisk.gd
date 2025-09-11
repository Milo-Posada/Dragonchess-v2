extends Piece

@onready var mesh_node = $CollisionShape3D/Snake
func _ready():
	mesh = mesh_node
	init_piece()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

extends StaticBody3D
class_name Piece

var mesh: Node3D = null

const white_material = preload("res://pieces/white_piece.tres")
const black_material = preload("res://pieces/black_piece.tres")
const shaders = preload("res://pieces/piece.gdshader")
const overlay = preload("res://pieces/piece_overlay.tres")

var is_white: bool

func _ready():
	print("run in piece")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func init_piece():
	if mesh:  # only run if mesh is set
		for part in mesh.get_children():
			if is_white:
				part.set_material_override(white_material)
				rotation_degrees = Vector3(0, -90, 0)
			else:
				part.set_material_override(black_material)
				rotation_degrees = Vector3(0, 90, 0)
				
func get_available_moves(piece_name: String, current_pos: Vector3i, move_type: String = "move") -> Array:
	var moves = []
	#var rel_moves = move_dict[piece_type][move_type]
	#for offset in rel_moves:
		#var target = current_pos + offset
		## Optional: validate target is on board
		#if is_valid_square(target):
			#moves.append(target)
	return moves

func _on_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
		print("click")
		visible = false

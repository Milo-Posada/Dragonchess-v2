extends StaticBody3D
class_name Piece

const first = preload("res://first_player.tres")
const second = preload("res://second_player.tres")
const shaders = preload("res://pieces/piece.gdshader")
const overlay = preload("res://new_shader_material.tres")
const sylph = preload("res://pieces/piece_scenes/sylph.tscn")

var white: bool

func _ready():
	print("run in piece")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
		print("click")
		visible = false

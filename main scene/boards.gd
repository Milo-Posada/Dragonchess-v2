extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_ui_board_1_button():
	var board = get_node("Board1")
	board.visible = !board.visible
func _on_ui_board_2_button():
	var board = get_node("Board2")
	board.visible = !board.visible
func _on_ui_board_3_button():
	var board = get_node("Board3")
	board.visible = !board.visible

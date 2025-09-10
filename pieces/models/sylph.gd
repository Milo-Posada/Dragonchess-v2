extends Piece

# Called when the node enters the scene tree for the first time.
func _ready():
	print("im born")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
		print("here")
		visible = false

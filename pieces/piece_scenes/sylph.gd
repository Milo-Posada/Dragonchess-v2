extends Piece

@onready var mesh = $CollisionShape3D/Sylph
func _ready():
	print("run in sylph")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

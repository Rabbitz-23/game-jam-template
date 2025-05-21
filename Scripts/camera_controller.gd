extends Camera2D

# Target node the camera is following
@onready var TargetNode : Node2D = get_node("../Player")

func _process(_delta) -> void:
	set_position(TargetNode.get_position())	

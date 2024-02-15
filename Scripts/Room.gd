extends Node2D
class_name ARoom

enum RoomType {
	Null
}

onready var exit_points = [
	$LeftExit,
	$RightExit,
	$UpExit,
	$DownExit
]

var transitions = [
	0, 0, 0, 0 
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

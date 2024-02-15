extends Node2D

const room_w = 1024
const room_h = 608

export var room_scene : PackedScene

onready var player = $Character
onready var level = $Level as Node2D;
onready var cur_room = $Level/Room as ARoom;
onready var camera = $MainCamera as Camera2D
onready var room_delete_timer = $RoomDeleteTimer as Timer;

func _ready():
	player.visNotifier.connect("screen_exited",self,"player_left")

func player_left():
	var dirs = [ # const
		Vector2.LEFT * room_w,
		Vector2.RIGHT * room_w,
		Vector2.UP * room_h,
		Vector2.DOWN * room_h
	]
	
	var closest_exit = 0
	var min_dist = INF
	for i in range(4):
		var dist_i = (player.global_position-cur_room.exit_points[i].global_position).length()
		if  dist_i < min_dist:
			min_dist = dist_i;
			closest_exit = i;
	
	var new_room = make_room(cur_room.transitions[closest_exit],
		cur_room.global_position + dirs[closest_exit]);
	level.add_child(new_room);
	
	camera.global_position = new_room.global_position; # TODO: эффект перехода
	
	room_delete_timer.connect("timeout",cur_room,"queue_free");
	room_delete_timer.start();
	cur_room = new_room;

func make_room(type : int, pos : Vector2) -> ARoom:
	var room = room_scene.instance() as ARoom;
	room.global_position = pos
	# TODO: сделать тут чета
	print("room created!")
	return room;

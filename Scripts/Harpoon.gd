extends Weapon

export var harpoon_proj : PackedScene
export var launch_force : float

onready var proj_pos = $ProjPos as Position2D;
onready var proj_sprite = $Proj as Sprite;

func use():
	var P = harpoon_proj.instance() as RigidBody2D
	P.global_position = proj_pos.global_position
	get_tree().current_scene.add_child(P)
	P.rotation = global_rotation
	P.apply_central_impulse(Vector2.RIGHT.rotated(global_rotation)*launch_force);

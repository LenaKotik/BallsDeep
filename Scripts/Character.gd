extends KinematicBody2D

export var speed : float;

onready var visNotifier = $VisibilityNotifier2D as VisibilityNotifier2D
onready var weapons = $Weapons as Node2D;
onready var selected_weapon = $Weapons/Harpoon as Weapon;

var velocity = Vector2.ZERO;

func _physics_process(_delta):
	velocity += speed * Vector2(Input.get_action_strength("right")-Input.get_action_strength("left"),
	Input.get_action_strength("down")-Input.get_action_strength("up")).normalized();
	
	velocity = lerp(velocity,Vector2.ZERO,0.1)
	
	move_and_slide(velocity);
	
	weapons.look_at(get_global_mouse_position());
	if Input.is_action_just_pressed("use_weapon"):
		selected_weapon.use();

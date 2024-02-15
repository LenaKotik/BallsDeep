extends KinematicBody2D

export var speed : float;

var velocity = Vector2.ZERO;

func _physics_process(_delta):
	velocity += speed * Vector2(Input.get_action_strength("right")-Input.get_action_strength("left"),
	Input.get_action_strength("down")-Input.get_action_strength("up")).normalized();
	
	velocity = lerp(velocity,Vector2.ZERO,0.1)
	
	move_and_slide(velocity);

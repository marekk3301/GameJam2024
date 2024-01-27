class_name BabyHappyState
extends State
 
func Physics_update(_delta):
	var is_jump_just_pressed: bool = Input.is_action_just_pressed("jump")
	
	if is_jump_just_pressed:
		if actor.is_on_floor():
			transitioned.emit("JumpingJumpState")
		else:
			transitioned.emit("DoubleJumpingJumpState")

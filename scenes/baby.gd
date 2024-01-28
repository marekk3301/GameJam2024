class_name StateMachine
extends Node
 
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var scoreNode = get_node("/root/Score")

func _ready():
	pass

func _process(delta):
	if scoreNode.points <= 20:
		animated_sprite_2d.play('cry')
	elif scoreNode.points <= 45:
		animated_sprite_2d.play('smile')
	else:
		animated_sprite_2d.play('laugh')

extends Node2D

@onready var animated_sprite = $AnimatedSprite2D
#@onready var animation_player_fade = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	#animated_sprite.hide()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("ui_down"):
		#animated_sprite.show()
		#animation_player_fade.play("fade")
		animated_sprite.play("play")

func _on_animated_sprite_2d_bumbum_animation_finished():
	#animated_sprite.hide()
	#animation_player_fade.stop()
	#animated_sprite.stop()
	animated_sprite.play("default")


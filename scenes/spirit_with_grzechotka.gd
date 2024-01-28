extends Node2D

@onready var animated_sprite = $AnimatedSprite2D

var audio_rattle = preload("res://audio/rattle.ogg")
@onready var player_rattle = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	player_rattle.stream = audio_rattle

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("ui_up"):
		player_rattle.play()
		animated_sprite.play("play")

func _on_animated_sprite_2d_animation_finished():
	animated_sprite.play("default")

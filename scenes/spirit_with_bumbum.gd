extends Node2D

@onready var animated_sprite = $AnimatedSprite2D

var audio_bumbum = preload("res://audio/beben.ogg")
@onready var player_bumbum = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	player_bumbum.stream = audio_bumbum

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("ui_down"):
		player_bumbum.play()
		animated_sprite.play("play")

func _on_animated_sprite_2d_bumbum_animation_finished():
	animated_sprite.play("default")

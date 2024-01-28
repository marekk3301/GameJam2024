extends Node2D

@onready var animated_sprite = $AnimatedSprite2D

var audio_TV = preload("res://audio/static.ogg")
@onready var player_TV = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	player_TV.stream = audio_TV

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("ui_left"):
		player_TV.play()
		animated_sprite.play("play")

func _on_animated_sprite_2dtv_animation_finished():
	animated_sprite.play("default")

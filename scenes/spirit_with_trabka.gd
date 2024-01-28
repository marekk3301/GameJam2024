extends Node2D

@onready var animated_sprite = $AnimatedSprite2D

var audio_trabka = preload("res://audio/trabka.ogg")
@onready var player_trabka = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	player_trabka.stream = audio_trabka
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("ui_right"):
		player_trabka.play()
		animated_sprite.play("play")

func _on_animated_sprite_2d_trabka_animation_finished():
	animated_sprite.play("default")

extends Node2D

var audio = preload("res://audio/music_box_1.ogg")
@onready var player = $AudioStreamPlayer

var is_playing = false

func _ready():
	player.stream = audio
	

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("ui_accept") and is_playing == false:
			is_playing = true
			player.play()

func _on_audio_stream_player_finished():
	print("Koniec 1")
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	print("Koniec 2")

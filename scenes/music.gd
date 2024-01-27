extends Node2D

var audio = preload("res://music/music_box_1.ogg")
@onready var player = $AudioStreamPlayer

var speed
var started
var pre_start_duration
var start_pos_in_sec

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setup(game):
	player.setup = game.audio
	
	speed = game.speed
	started = false
	pre_start_duration = game.bar_length_in_m
	start_pos_in_sec =game.start_pos_in_sec

func start():
	started = true
	player.play(start_pos_in_sec)

func _process(delta):
	if not started:
		pre_start_duration -= speed*delta
		if pre_start_duration <= 0:
			start()
			return

# d-_-b



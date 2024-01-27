extends Node2D

@onready var music_node = $Music
@onready var road_node = $Road

var audio

var bpm
var bar_length_in_m
var quarter_time_in_sec
var speed
var note_scale
var start_pos_in_sec

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

# Called when the node enters the scene tree for the first time.
func _ready():
	audio = load("res://music_box_1.ogg")
	calc_params()
	
	music_node.setup(self)
	road_node.setup(self)

func calc_params():
	bpm = 120
	bar_length_in_m = 8
	quarter_time_in_sec = 60/float(bpm)
	speed = bar_length_in_m/float(4*quarter_time_in_sec)
	note_scale = bar_length_in_m/float(4*400)
	start_pos_in_sec = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

extends Node2D

#@onready var music_node = $Music
@onready var road_node = $Road

var audio

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _ready():
	pass

func _process(delta):
	pass

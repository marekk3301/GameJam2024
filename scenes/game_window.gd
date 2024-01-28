extends Node2D

#@onready var music_node = $Music
@onready var road_node = $Road

var audio

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _ready():
	pass

func _process(delta):
	pass

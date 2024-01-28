extends Node2D

@onready var scoreNode = get_node("/root/Score")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit

func _on_start_button_pressed():
	scoreNode.points = 0
	get_tree().change_scene_to_file("res://scenes/game_window.tscn")

func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")

func _on_exit_button_pressed():
	get_tree().quit()


extends Node2D


func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("ui_accept"):
			hide()

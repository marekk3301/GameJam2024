extends Node2D

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_retry_pressed():
	get_tree().change_scene_to_file("res://scenes/game_window.tscn")


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_exit_pressed():
	get_tree().quit()

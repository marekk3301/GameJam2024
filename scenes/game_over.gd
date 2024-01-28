extends Node2D

func _on_retry_pressed():
	get_tree().change_scene_to_file("res://scenes/game_window.tscn")


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_exit_pressed():
	get_tree().quit()

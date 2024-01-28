extends Node2D

@export var line: int = 0

var is_pressed = false
var is_collecting = false

func _ready():
	pass


func _input(event):
	match line:
		1:
			if event.is_action_pressed("ui_up"):
				is_pressed = true
				is_collecting = true
			elif event.is_action_released("ui_up"):
				is_pressed = false
				is_collecting = false
		2:
			if event.is_action_pressed("ui_left"):
				is_pressed = true
				is_collecting = true
			elif event.is_action_released("ui_left"):
				is_pressed = false
				is_collecting = false
		3:
			if event.is_action_pressed("ui_down"):
				is_pressed = true
				is_collecting = true
			elif event.is_action_released("ui_down"):
				is_pressed = false
				is_collecting = false
		4:
			if event.is_action_pressed("ui_right"):
				is_pressed = true
				is_collecting = true
			elif event.is_action_released("ui_right"):
				is_pressed = false
				is_collecting = false

func _process(delta):
	if is_pressed:
		self.scale = Vector2(1.1, 1.1)
	else:
		self.scale = Vector2(1, 1)

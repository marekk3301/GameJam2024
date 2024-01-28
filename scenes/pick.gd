extends Node2D

@export var line: int = 0

var audio_rattle = preload("res://audio/rattle.ogg")
@onready var player_rattle = $AudioRattleStreamPlayer2D

var audio_TV = preload("res://audio/static.ogg")
@onready var player_TV = $AudioTVStreamPlayer2D

#var animated_sprite_TV = preload("res://scenes/pick.tscn").instantiate()
#@onready var _animated_sprite_tv = $AnimatedSprite2DTV
@export var animation_tv:PackedScene = preload("res://scenes/spirit_with_tv.tscn")

var is_pressed = false
var is_collecting = false

func _ready():
	player_rattle.stream = audio_rattle
	player_TV.stream = audio_TV

func _input(event):
	match line:
		1:
			if event.is_action_pressed("ui_up"):
				is_pressed = true
				is_collecting = true
				player_rattle.play()
			elif event.is_action_released("ui_up"):
				is_pressed = false
				is_collecting = false
		2:
			if event.is_action_pressed("ui_left"):
				is_pressed = true
				is_collecting = true
				player_TV.play()
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

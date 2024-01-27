extends Node2D

@export var line: int = 0
var note_position = 0

var bpm = 120
var speed = bpm * 1/30

func set_note_position():
	var line_height
	match line:
		1:
			line_height = 806
		2:
			line_height = 882
		3:
			line_height = 958
		4:
			line_height = 1034
	self.position = Vector2(1000 + note_position, line_height)


func move():
	self.position.x -= 4


# Called when the node enters the scene tree for the first time.
func _ready():
	set_note_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move()

extends Node2D

@export var line: int = 0
var note_position = 0

var is_colliding = false
var picker
var collected = false


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
	collect()


func collect():
	if not collected:
		if is_colliding and picker:
			if picker.is_collecting:
				collected = true
				picker.is_collecting = false
				hide()


func _on_area_entered(area):
	if area.is_in_group("picker"): 
		is_colliding = true
		picker = area.get_parent()


func _on_area_exited(area):
	if area.is_in_group("picker"): 
		is_colliding = false

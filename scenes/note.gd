extends Node2D

@onready var scoreNode = get_node("/root/Score")
@export var line: int = 0
var note_position = 0

var is_colliding = false
var picker
var collected = false

var bpm = 80
var speed = 114.28

func set_note_position():
	var line_height
	match line:
		1:
			line_height = 0
		2:
			line_height = 76
		3:
			line_height = 76 * 2
		4:
			line_height = 76 * 3
	self.position = Vector2(note_position, line_height)


func move(delta):
	if self.position.x < -300:
		queue_free()
	else:
		self.position.x -= speed * delta


# Called when the node enters the scene tree for the first time.
func _ready():
	set_note_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)
	collect()


func collect():
	if not collected:
		if is_colliding and picker:
			if picker.is_collecting:
				collected = true
				picker.is_collecting = false
				scoreNode.points += 1
				hide()


func _on_area_entered(area):
	if area.is_in_group("picker"): 
		is_colliding = true
		picker = area.get_parent()


func _on_area_exited(area):
	if area.is_in_group("picker"): 
		is_colliding = false

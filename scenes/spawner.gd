extends Node2D

var note_scene = preload("note.tscn")

var notes_data = [
	{
		"pos": 0,
		"line": 3 
	},
	{
		"pos": 100,
		"line": 2 
	},
	{
		"pos": 300,
		"line": 1 
	},
	{
		"pos": 400,
		"line": 3 
	},
	{
		"pos": 500,
		"line": 4 
	},
	{
		"pos": 700,
		"line": 3 
	},
	{
		"pos": 800,
		"line": 2 
	},
	{
		"pos": 1000,
		"line": 1 
	},
	{
		"pos": 1100,
		"line": 3 
	},
	{
		"pos": 1500,
		"line": 4 
	},
]
# Called when the node enters the scene tree for the first time.
func _ready():
	add_notes()

func add_notes():
	for note_data in notes_data:
		var note = note_scene.instantiate()
		note.line = note_data.line
		note.note_position = note_data.pos
		add_child(note)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

extends Node2D

var note_scene = preload("note.tscn")

var is_spawning = false

var audio_map1 = "res://audio_maps/music_box.mboy"

var barShift = 0

var line1_data = [
	{
		"pos": 0,
		"line": 1 
	},
	{
		"pos": 300,
		"line": 1 
	}
]
# Called when the node enters the scene tree for the first time.
var num_of_0 = -1;


func _ready():
	pass


func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("ui_accept") and is_spawning == false:
			is_spawning = true
			add_notes()

func add_notes():
	var parsed_json = load_map(audio_map1)
	if parsed_json != null:
		for track in parsed_json.tracks:
			for bar in track.bars:
				for note in bar.notes:
					# Access the 'pos' value for each note
					var note_pos = note.pos
					if note_pos == 0:
						num_of_0 += 1
					var calc_pos = note_pos + (num_of_0 * 1600)
					print("Note position:", calc_pos)

					note = note_scene.instantiate()
					note.line = 1
					note.note_position = calc_pos
					add_child(note)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func load_map(map_file):
	var file = FileAccess.open(map_file, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	var json = JSON.new()
	return json.parse_string(content)



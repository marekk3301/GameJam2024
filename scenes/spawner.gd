extends Node2D

var note_scene = preload("note.tscn")

var is_spawning = false

var audio_map1 = "res://audio_maps/music_box.mboy"

var num_of_0 = -1;



func _ready():
	pass


func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("ui_accept") and is_spawning == false:
			is_spawning = true
			add_notes()

var next_position = 0;

func add_notes():
	var parsed_json = load_map(audio_map1)
	if parsed_json != null:
		for track in parsed_json.tracks:
			for bar in track.bars:
				print(bar)
				#var time_to_end = 1600
				
				for note in bar.notes:
					var next = next_position
					#time_to_end = 1600
					# Access the 'pos' value for each note
					var note_pos = note.pos
					next += note_pos;
					print("Note position:", next)
					#time_to_end -= note_pos
					note = note_scene.instantiate()
					note.line = 1
					note.note_position = next /5
					add_child(note)
				next_position += 1600

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func load_map(map_file):
	var file = FileAccess.open(map_file, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	var json = JSON.new()
	return json.parse_string(content)



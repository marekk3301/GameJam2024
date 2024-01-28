extends Node2D

var note_scene = preload("note.tscn")

var is_spawning = false

#var audio_map = "res://audio_maps/music_box.json"
var audio_map_rattle = "res://audio_maps/debug_map.json"
var audio_map_TV = "res://audio_maps/static_map.json"
var audio_map_bumbum = "res://audio_maps/drum_map.json"
var audio_map_trabka = "res://audio_maps/empty_map.json"

var num_of_0 = -1;


func _ready():
	pass


func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("ui_accept") and is_spawning == false:
			is_spawning = true
			add_notes(audio_map_rattle, 1)
			add_notes(audio_map_TV, 2)
			add_notes(audio_map_bumbum, 3)
			add_notes(audio_map_trabka, 4)


func add_notes(audio_map, lineNum):
	var next_position = 0;
	var parsed_json = load_map(audio_map)
	if parsed_json != null:
		for track in parsed_json.tracks:
			#print("Track: ", track)
			for bar in track.bars:
				#print("Bar: ", bar)
				#var time_to_end = 1600
				
				for note in bar.notes:
					var next = next_position
					#time_to_end = 1600
					# Access the 'pos' value for each note
					var note_pos = note.pos
					next += note_pos;
					#print("Note position:", next)
					#time_to_end -= note_pos
					note = note_scene.instantiate()
					print(lineNum)
					note.line = lineNum
					note.note_position = next / (23/3)
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



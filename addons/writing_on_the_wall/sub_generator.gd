tool
extends Spatial

#var ES = preload("res://addons/writing_on_the_wall/ES_parts/sub_display.tscn")
var subtitleParent = Spatial.new()

func _ready():
	print("Initializing subtitles...")
	get_json('res://addons/writing_on_the_wall/subtitles/')

func get_json(path):
	var directory = Directory.new()
	if directory.open(path) != OK:
		printerr("Error: could not open directory", path)
		return
	elif directory.list_dir_begin(true, true) != OK:
		printerr("Error: could not list directory items", path)
		return
	else:
		var file = directory.get_next()
		while(file):
			if file.get_extension() == "json":
				print(file)
				var json_file = File.new()
				if json_file.open(path + "/" + file, File.READ) != OK:
					printerr('Error: found JSON file could not be read')
				var data_text = json_file.get_as_text()
				json_file.close()
				var json_parse = JSON.parse(data_text)
				if json_parse.error != OK:
					printerr('Error: found JSON file does not contain valid JSON')
				var data = json_parse.result
				if data:
					save_subtitles(data)
			file = directory.get_next()

func save_subtitles(data):
	SubManager.set_title(data.title)
	SubManager.set_line_count(data.text.size())
	for line in data.text:
		SubManager.set_text(line, data.text[line])
	print(SubManager.subtitle_data)

#func generate_env_subtitles(data):
#	var keys = data.text.keys()
#	var lines = data.text.values()
#	for i in data.text.size():
#		var subtitle = ES.instance()
#		print(lines[i])
#		subtitle.get_node("Viewport/Control/Label").text = lines[i]
#		subtitle.name = keys[i]
#		subtitleParent.add_child(subtitle)
#		subtitle.set_owner(subtitleParent)
#		subtitle.get_node("Viewport").set_owner(subtitleParent)
#		subtitle.get_node("Viewport/Control").set_owner(subtitleParent)
#		subtitle.get_node("Viewport/Control/Label").set_owner(subtitleParent)
#	save_generated_subtitles(data.title)
#
#func save_generated_subtitles(title):
#	var scn = PackedScene.new()
#	subtitleParent.name = title
#	scn.pack(subtitleParent)
#	ResourceSaver.save(title + ".tscn", scn)

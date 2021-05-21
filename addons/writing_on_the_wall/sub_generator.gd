tool
extends Spatial

#var ES = preload("res://addons/writing_on_the_wall/ES_parts/sub_display.tscn")
var subtitleParent = Spatial.new()
export var story_to_show: String

func _ready():
	print("Initializing subtitles.")
	if story_to_show:
		get_story_to_show()
	else: 
		get_json('res://addons/writing_on_the_wall/subtitles/')

func get_story_to_show():
	#Open File and get all lines
	var data_file = File.new()
	if data_file.open('res://addons/writing_on_the_wall/subtitles/' + story_to_show + '.json', File.READ) != OK:
		printerr('Error: file could not be read')
		return
	var data_text = data_file.get_as_text()
	data_file.close()
	var data_parse = JSON.parse(data_text)
	if data_parse.error != OK:
		printerr('Error: File does not contain valid JSON')
		return
	var data = data_parse.result
	if data:
		save_subtitles(data)

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
					print('Now showing the story: ' + data.title)
					save_subtitles(data)
			file = directory.get_next()

func save_subtitles(data):
	SubManager.set_title(data.title)
	SubManager.set_line_count(data.text.size())
	for line in data.text:
		SubManager.set_text(line, data.text[line])

func change_story_to_show(new_story, reset):
	story_to_show = new_story
	get_story_to_show()

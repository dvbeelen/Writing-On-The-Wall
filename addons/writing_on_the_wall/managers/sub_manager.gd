extends Node

var subtitle_data = {
	"title": "",
	"text" : {},
	"line_count": 0
}

var text_effect
var text_color

var current_line = -1
var writing_speed = 0.05

func set_title(title):
	subtitle_data.title = title

func set_text(index, line):
	subtitle_data.text[index] = line

func set_line_count(line_count):
	subtitle_data.line_count = line_count

func get_current_line():
	if String(current_line) in subtitle_data.text:
		return subtitle_data.text[String(current_line)]
	else:
		print('Error: No more text to display.')

func next_line():
	if String(current_line) in subtitle_data.text:
		get_tree().get_current_scene().get_node("SubGenerator/DisplayManager").next_child()

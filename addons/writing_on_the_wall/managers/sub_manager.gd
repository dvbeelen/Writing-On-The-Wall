extends Node

var subtitle_data = {
	"title": "",
	"text" : {},
	"line_count": 0
}

var current_line = 0

func set_title(title):
	subtitle_data.title = title

func set_text(index, line):
	subtitle_data.text[index] = line

func set_line_count(line_count):
	subtitle_data.line_count = line_count

func get_current_line():
	return subtitle_data.text[String(current_line)]

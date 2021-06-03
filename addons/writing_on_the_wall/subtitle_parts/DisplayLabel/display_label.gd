tool
extends RichTextLabel

func _ready():
	bbcode_enabled = true

func show_line(line): 
	print('Display: Showing line ' + String(SubManager.current_line))
#	Apply text effects
	if SubManager.text_effect:
#	Apply color
		append_bbcode('[' + SubManager.text_effect  + ']')
#	Print text
	if SubManager.text_color:
		push_color(SubManager.text_color)
	for letter in line:
		yield(get_tree().create_timer(SubManager.writing_speed), 'timeout')
		self.add_text(letter)

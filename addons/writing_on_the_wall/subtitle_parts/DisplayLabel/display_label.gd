tool
extends RichTextLabel

func show_line(line): 
	print('Display: Showing line ' + String(SubManager.current_line))
	for letter in line:
		yield(get_tree().create_timer(SubManager.writing_speed), 'timeout')
		self.add_text(letter)

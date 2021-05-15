tool
extends RichTextLabel

func show_line(line):
	for letter in line:
		yield(get_tree().create_timer(.2), 'timeout')
		self.add_text(letter)

extends Node

export var path_to_font: String

func _ready():
	if self.get_child_count() == 0:
		printerr('Error: To use this node, you need to add sub_display instances to it.')
	
	if path_to_font:
		set_display_font(path_to_font)


func next_child():
	if self.get_child(SubManager.current_line):
		self.get_child(SubManager.current_line).active = true
		self.get_child(SubManager.current_line).get_node("Viewport/Control/SubDisplayLabel").show_line(SubManager.get_current_line())
	else:
		print('Warning: Not enough sub_displays added to show all text.')

func set_display_font(path_to_font):
	for display in self.get_children():
		display.get_node("Viewport/Control/SubDisplayLabel").add_font_override('normal_font', load(path_to_font))

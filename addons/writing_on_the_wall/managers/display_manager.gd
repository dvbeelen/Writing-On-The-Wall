extends Node

func _ready():
	if self.get_child_count() == 0:
		printerr('Error: To use this node, you need to add sub_display instances to it.')

func next_child():
	self.get_child(SubManager.current_line -1).active = false
	if self.get_child(SubManager.current_line):
		self.get_child(SubManager.current_line).active = true
		self.get_child(SubManager.current_line).get_node("Viewport/Control/SubDisplayLabel").show_line(SubManager.get_current_line())
	else:
		print('Warning: Not enough sub_displays added to show all text.')


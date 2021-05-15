extends Node

var current_child = 0

func _ready():
	if self.get_child_count() == 0:
		printerr('Error: To use this node, you need to add sub_display instances to it.')

func init():
	self.get_child(current_child).get_node("Viewport/Control/SubDisplayLabel").show_line(SubManager.get_current_line())

func next_child(number):
	self.get_child(number).get_node("Viewport/Control/SubDisplayLabel").show_line(SubManager.get_current_line())


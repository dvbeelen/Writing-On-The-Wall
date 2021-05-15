tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("SubGenerator", "Spatial", preload("sub_generator.gd"), preload("icon_small.png"))


func _exit_tree():
	remove_custom_type("SubGenerator")

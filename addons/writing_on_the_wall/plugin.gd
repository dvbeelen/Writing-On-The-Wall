tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("SubGenerator", "Spatial", load("sub_generator.gd"), load("src/icon_small.png"))
	add_custom_type("SubDisplayLabel", "RichTextLabel", load("subtitle_parts/DisplayLabel/display_label.gd"), load("src/icon_small.png"))
	add_custom_type("DisplayManager", "Spatial", load("managers/display_manager.gd"), load("src/icon_small.png"))


func _exit_tree():
	remove_custom_type("SubGenerator")
	remove_custom_type("SubDisplayLabel")
	remove_custom_type("DisplayManager")

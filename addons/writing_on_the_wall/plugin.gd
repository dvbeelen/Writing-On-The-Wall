tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("SubGenerator", "Spatial", preload("sub_generator.gd"), preload("src/icon_small.png"))
	add_custom_type("SubDisplayLabel", "RichTextLabel", preload("subtitle_parts/DisplayLabel/display_label.gd"), preload("src/icon_small.png"))
	add_custom_type("DisplayManager", "Spatial", preload("managers/display_manager.gd"), preload("src/icon_small.png"))


func _exit_tree():
	remove_custom_type("SubGenerator")
	remove_custom_type("SubDisplayLabel")
	remove_custom_type("DisplayManager")

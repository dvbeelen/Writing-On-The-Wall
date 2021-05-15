extends Spatial


func _ready():
	get_node("EnvironmentalSubtitle/Viewport/Control/SubDisplayLabel").showLine(SubManager.get_current_line())

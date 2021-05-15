extends Spatial

onready var Timer = get_node("Viewport/Control/Timer")
onready var Label = get_node("Viewport/Control/Label")

onready var stringPrinted = "This is a test"

func _ready():
	Timer.set_wait_time(.5) # time between letters
	_dialogue( stringPrinted )

func _dialogue( string ):
	for letter in string:
		Timer.start()
		Label.add_text( letter )
		yield(Timer, "timeout")

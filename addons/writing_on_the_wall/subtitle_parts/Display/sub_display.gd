extends Spatial

enum effects {
	None,
	Wave,
	Tornado,
	Rainbow,
}
export(effects) var effect

export var color= ''

var active = false

func _process(delta):
	if active:
		if effect:
			SubManager.text_effect = effect
		if color:
			SubManager.text_color = color

extends Spatial

func _on_area_body_entered(body):
	SubManager.current_line += 1
	get_parent().get_parent().showText()
	print('Trigger: area entered')


func _on_area_body_exited(body):
	get_parent().get_parent().removeText()
	get_node("area/col").disabled = true
	print('Trigger: exited area')

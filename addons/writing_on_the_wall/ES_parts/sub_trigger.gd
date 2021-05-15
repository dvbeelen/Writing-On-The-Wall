extends Spatial

func _on_area_body_entered(body):
	if body.name == 'Player':
		SubManager.textTriggerNr += 1
		get_parent().get_parent().showText()
		print('area entered')


func _on_area_body_exited(body):
	if body.name == 'Player':
		get_parent().get_parent().removeText()
		get_node("area/col").disabled = true
		print('area left')

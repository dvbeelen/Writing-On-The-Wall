extends Spatial

func _on_area_body_entered(body):
	if body.name == 'Player':
		SubManager.current_line += 1
		SubManager.next_line()
		print('Trigger: area entered')


func _on_area_body_exited(body):
	if body.name == 'Player':
		get_node("area/col").disabled = true
		print('Trigger: exited area')

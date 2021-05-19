extends Spatial

func _on_area_body_entered(body):
#	Check if body entered is the player and if the text file has a next line
	if body.name == 'Player' && String(SubManager.current_line + 1) in SubManager.subtitle_data.text:
		SubManager.current_line += 1
		SubManager.next_line()
		print('Trigger: area entered')
	else:
		print('Warning: Reached the last displayable line')


func _on_area_body_exited(body):
	if body.name == 'Player':
		get_node("area/col").disabled = true
		print('Trigger: exited area')

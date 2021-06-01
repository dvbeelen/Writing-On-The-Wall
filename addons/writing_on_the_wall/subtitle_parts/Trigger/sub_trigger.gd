extends Spatial

export var disable_on_leave: bool

func _on_area_body_entered(body):
#	Check if body entered is the player and if the text file has a next line
	if body.name != 'Player':
		print("Warning: TextTrigger is colliding with a body that is not Player")
	if body.name != 'Player':
		print("Warning: TextTrigger is colliding with a body that is not Player")
	if body.name == 'Player' && String(SubManager.current_line + 1) in SubManager.subtitle_data.text:
		SubManager.current_line += 1
		SubManager.next_line()
		print('Trigger: area entered')
	else:
		print('Warning: Reached the last displayable line')


func _on_area_body_exited(body):
	if body.name == 'Player' && disable_on_leave:
		get_node("area/col").disabled = true
	else:
		print('Trigger: exited area')

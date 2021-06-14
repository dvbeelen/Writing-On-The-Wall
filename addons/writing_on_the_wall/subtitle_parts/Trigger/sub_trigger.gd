extends Spatial

export var disable_on_leave: bool
export var triggering_body_name: String = 'Player'

func _on_area_body_entered(body):
#	Check if body entered is the player and if the text file has a next line
	if body.name == triggering_body_name && String(SubManager.current_line + 1) in SubManager.subtitle_data.text:
		SubManager.current_line += 1
		SubManager.next_line()
		print('Trigger: area entered')
	else:
		print('Warning: Reached the last displayable line')
	if body.name != triggering_body_name:
		print("Warning: TextTrigger is colliding with a body that is not Player")


func _on_area_body_exited(body):
	if body.name == triggering_body_name && disable_on_leave:
		get_node("area/col").disabled = true
	else:
		print('Trigger: exited area')

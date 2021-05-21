extends KinematicBody

#Components
onready var camera = $camera

#Physics
var moveSpeed: float = 5.0
var gravity: float = 12.0

#Camera 
var minLookAngle: float = -90.0
var maxLookAngle: float = 90.0
var lookSensitivity : float = 10.0

#Vectors
var velocity: Vector3 = Vector3()
var mouseDelta: Vector2 = Vector2()

#On start, hide the mouse
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
#	Close game if escape is pressed
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()
	
#	Move Camera based on mouse movement
	camera.rotation_degrees.x -= mouseDelta.y * lookSensitivity * delta
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, minLookAngle, maxLookAngle)
	
#	Rotate player based on mouse movement
	rotation_degrees.y -= mouseDelta.x * lookSensitivity * delta
	
#	Reset mouse vector
	mouseDelta = Vector2()
	
##	Reset mouse to center of screen
#	get_viewport().warp_mouse(get_viewport().size / 2)

func _input(event):
	if event is InputEventMouseMotion:
		mouseDelta = event.relative

func _physics_process(delta):
	velocity.x = 0
	velocity.z = 0
	
	var input = Vector2()
	
#	Movement Inputs
	if Input.is_action_pressed("ui_up"):
		input.y -= 1
	if Input.is_action_pressed("ui_down"):
		input.y += 1
	if Input.is_action_pressed("ui_left"):
		input.x -= 1
	if Input.is_action_pressed("ui_right"):
		input.x += 1
	if Input.is_action_just_pressed("ui_select"):
		get_parent().get_node("SubGenerator").change_story_to_show('Moby Dick', true)
	input = input.normalized()
	
#	Get the forward and right directions
	var forward = global_transform.basis.z
	var right = global_transform.basis.x
	
	var relativeDir = (forward * input.y + right * input.x)
	
#	Set the velocity
	velocity.x = relativeDir.x * moveSpeed
	velocity.z = relativeDir.z * moveSpeed
	
#	Apply gravity
	velocity.y -= gravity * delta
	
#	Move the player
	velocity = move_and_slide(velocity, Vector3.UP)

extends Node3D

@onready var parent = get_parent()
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var mouse_sensitivity = 0.001 #0.01 to 0.001 is good

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var rotate: Vector2

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	pass

func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate.y = -event.relative.x * mouse_sensitivity
		rotate.x = -event.relative.y * mouse_sensitivity
	
	# Check for scroll
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
		print(str(self, "|| ", "Scroll Up"))

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
		print(str(self, "|| ", "Scroll Down"))
		 


func get_raycast():
	#print(str("raycast test: " , $RayCast3D.get_collider()))
	
	return $head/RayCast3D.get_collider()

# Jump
func _jump():
	if Input.is_action_just_pressed("spacebar") and parent.is_on_floor():
		parent.velocity.y = JUMP_VELOCITY	

# Crouch?

# Walk
func _walk():
	var input_dir = Input.get_vector("d", "a", "s", "w")
	var direction = (global_transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		parent.velocity.x = direction.x * SPEED
		parent.velocity.z = direction.z * SPEED
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, SPEED)
		parent.velocity.z = move_toward(parent.velocity.z, 0, SPEED)

# Run

func move_and_look(delta):
	# mouse input
	parent.rotate_y(rotate.y)
	$head/RayCast3D.rotate_x(rotate.x)
	$head/Camera3D.rotate_x(rotate.x)
	$head/Camera3D.rotation.x = clampf($head/Camera3D.rotation.x, -deg_to_rad(88), deg_to_rad(88))
	rotate = Vector2.ZERO

	# Add the gravity.
	if not parent.is_on_floor():
		parent.velocity.y -= gravity * delta

	# Handle jump.
	_jump()

	# Get the input direction and handle the movement/deceleration.
	# Movement 
	_walk()

	get_parent().move_and_slide()
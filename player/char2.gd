extends CharacterBody3D

var state = {
	paused = false
}

var module = {}

func _ready():

	# check for node "hud" attatched to world when player enters the world
	if get_parent().get_node("hud") != null:
		print(str("HudTest: ", get_parent().get_node("hud")))
		module["hud"] = get_node("hud")

	# # check for node "raycast" attatched to player when player enters the world
	# if get_node("raycast") != null:
	# 	print(str("RaycastTest: ", get_node("raycast")))
	# 	module["raycast"] = true
	# 	print(module)

	# # check for node "move" attatched to player when player enters the world
	if get_node("move") != null:
		print(str("moveTest: ", get_node("move")))
		# module["move"] = true
		module["move"] = get_node("move")

	# Report registered states and modules
	print(str("char2 | States: ", state))
	print(str("char2 | Modules: ", module))

func _process(delta):
	if Input.is_action_just_pressed("esc"):
		if !state.paused:
			state.paused = true
		else: 
			state.paused = false
			print(module)
	
	if Input.is_action_just_pressed("lClick"):
		if module["move"] != null:
			var node = module["move"]
			print(str("char2 | ", node.get_raycast()))
		pass
		
func _physics_process(delta):
	# Check for this module later
	$move.move_and_look(delta)
	pass
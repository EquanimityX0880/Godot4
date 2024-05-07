extends Control

# Look for FileAccess to save/load

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = str("FPS: ", Engine.get_frames_per_second())
	pass

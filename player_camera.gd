extends Node3D

@export var top_down_rotation := -60.0
@export var bottom_up_rotation := -30.0

var is_camera_in_default_position := true
var camera_transitioning_down := false
var camera_transitioning_up := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_down") and is_camera_in_default_position:
		camera_transitioning_down = true
		camera_transitioning_up = false
		is_camera_in_default_position = false
	if Input.is_action_just_pressed("ui_up") and not is_camera_in_default_position:
		camera_transitioning_down = false
		camera_transitioning_up = true
		is_camera_in_default_position = false
	
	if camera_transitioning_down:
		rotation.x = lerp(rotation.x, top_down_rotation, 0.001)
	pass

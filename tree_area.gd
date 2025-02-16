extends Area3D

const WOOD_BLOCK = preload("res://items/wood.tscn")
const IMPULSE_FORCE = 3

var is_player_in_area := false
var hits := 0
@export var num_hits_to_chop := 3
@export var num_wood_blocks_to_produce := 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and is_player_in_area:
		hits += 1
		if hits >= num_hits_to_chop:
			#Spawns in the wood blocks
			for b in range(num_wood_blocks_to_produce):
				var wood = WOOD_BLOCK.instantiate()
				wood.position = position + Vector3(0, 2, 0)
				wood.rotation_degrees = Vector3(randi_range(0, 360), randi_range(0, 360), randi_range(0, 360))
				get_parent().add_child(wood)
				wood.apply_impulse(Vector3(randf_range(-IMPULSE_FORCE, IMPULSE_FORCE), randf_range(1, IMPULSE_FORCE), randf_range(-IMPULSE_FORCE, IMPULSE_FORCE)))
			# Removes the tree
			queue_free()

func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		is_player_in_area = true

func _on_body_exited(body: Node3D) -> void:
	if body.name == "Player":
		is_player_in_area = false

extends Node3D

const ITEM_SLOT = preload("res://inventory/item_slot.tscn")

@export var row_size := 10
@export var col_size := 3
var items := []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var window_size = get_window().size
	
	
	for x in range(row_size):
		items.append([])
		
		for y in range(col_size):
			items[x].append([])
			
			var instance = ITEM_SLOT.instantiate()
			instance.global_position = (window_size / 2) + Vector2i(x*50, y*50) - Vector2i(row_size/2*50, col_size/2*50)
			instance.slot_num = Vector2i(x, y)
			add_child(instance)
			items[x][y] = instance


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

extends Node



func _ready() -> void:
	create_grid_map()

func create_grid_map():
	var mesh_library = load("res://assets_library/assets_2.tres")
	if mesh_library == null:
		push_error("MeshLibrary not found!")
		return

	var grid_map = GridMap.new()
	grid_map.mesh_library = mesh_library
	grid_map.cell_size = Vector3(1, 1, 1)  # 1x1x1 meter grid size
	add_child(grid_map)

	generate_world(grid_map)

func generate_world(grid_map):
	# Loop to generate a 5x5 grid of floor tiles
	for x in range(5):
		for z in range(5):
			grid_map.set_cell_item(Vector3(x, 0, z), 1)  # Place floor block at (x, 0, z)

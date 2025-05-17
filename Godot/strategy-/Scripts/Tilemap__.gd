extends TileMap

const INF = 999999
const HEX_DIRECTIONS = [
	Vector2i(1, 0), Vector2i(1, -1), Vector2i(0, -1),
	Vector2i(-1, 0), Vector2i(-1, 1), Vector2i(0, 1)
]

var blocked_tiles: Dictionary = {}

func _ready():
	scan_blocked_tiles()

func scan_blocked_tiles():
	for cell in get_used_cells(0):
		var tile_data = get_cell_tile_data(0, cell)
		if tile_data != null and tile_data.get_custom_data("is_blocked"):
			blocked_tiles[cell] = true

func is_walkable(tile_pos: Vector2i) -> bool:
	return not blocked_tiles.has(tile_pos)

func get_neighbors(pos: Vector2i) -> Array:
	var neighbors = []
	for dir in HEX_DIRECTIONS:
		var neighbor = pos + dir
		if is_walkable(neighbor):
			neighbors.append(neighbor)
	return neighbors

func hex_distance(a: Vector2i, b: Vector2i) -> int:
	return int((abs(a.x - b.x) + abs(a.x + a.y - b.x - b.y) + abs(a.y - b.y)) / 2)

func find_path(start: Vector2i, goal: Vector2i) -> Array:
	var open_set: Array[Vector2i] = [start]
	var came_from: Dictionary = {}
	var g_score: Dictionary = {start: 0}
	var f_score: Dictionary = {start: hex_distance(start, goal)}
	
	while open_set.size() > 0:
		open_set.sort_custom(Callable(self, "_compare_scores").bind(f_score))
		var current: Vector2i = open_set[0]
		
		if current == goal:
			return reconstruct_path(came_from, current)
		
		open_set.remove_at(0)
		
		for neighbor in get_neighbors(current):
			var tentative_g = g_score.get(current, INF) + 1
			if tentative_g < g_score.get(neighbor, INF):
				came_from[neighbor] = current
				g_score[neighbor] = tentative_g
				f_score[neighbor] = tentative_g + hex_distance(neighbor, goal)
				if neighbor not in open_set:
					open_set.append(neighbor)
	
	return []

func _compare_scores(a: Vector2i, b: Vector2i, f_score: Dictionary) -> bool:
	return f_score.get(a, INF) < f_score.get(b, INF)

func reconstruct_path(came_from: Dictionary, current: Vector2i) -> Array:
	var total_path = [current]
	while came_from.has(current):
		current = came_from[current]
		total_path.insert(0, current)
	return total_path

# Optional: visualize the path using debug tile
func debug_draw_path(path: Array):
	for tile in path:
		set_cell(1, tile, 1)  # layer 1, tile = 1 (adjust this ID for a debug tile)

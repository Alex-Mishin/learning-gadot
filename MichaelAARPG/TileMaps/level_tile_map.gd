class_name level_tile_map extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LevelManager.change_tile_map_bounds(get_tilemap_bounds())


func get_tilemap_bounds() -> Array[Vector2]:
	var bounds: Array[Vector2] = [
		Vector2(get_used_rect().position * rendering_quadrant_size),
		Vector2(get_used_rect().end * rendering_quadrant_size)
	]
	return bounds

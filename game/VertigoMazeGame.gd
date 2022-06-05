extends Spatial



var level_index := 0

var current_level : MapBase = null

onready var levels : Array = $Levels.get_children()


func _ready():
	# Load the first level
	_load_level()


func _load_level():
	# Remove and free the current level
	if current_level:
		remove_child(current_level)
		current_level.queue_free()
		
	# Construct the level
	current_level = levels[level_index].map_scene.instance()
	add_child(current_level)
	current_level.connect("map_complete", self, "_on_map_complete")


func _on_map_complete():
	# Advance to the next level and load
	level_index = (level_index + 1) % levels.size()
	_load_level()

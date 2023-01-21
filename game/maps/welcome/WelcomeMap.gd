tool
extends MapBase


# Called when the node enters the scene tree for the first time.
func _ready():
	$WelcomeScreen.connect_scene_signal("start_pressed", self, "_on_start_pressed")
	enable_ui_interactions(true)


func _on_start_pressed():
	load_next_map()

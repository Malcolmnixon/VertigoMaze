class_name WelcomeMap
extends MapBase


# Called when the node enters the scene tree for the first time.
func _ready():
	$WelcomeScreen.connect_scene_signal("start_pressed", self, "_on_start_pressed")
	$Player.enable_ui_interactions(true)


func _on_start_pressed():
	$Player.fade_out("finish", 3)


func _on_Player_fade_complete(id):
	match id:
		"finish":
			emit_signal("map_complete")

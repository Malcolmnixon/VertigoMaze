tool
extends MapBase


func _ready():
	$CreditsScreen.connect_scene_signal("finished", self, "_on_CreditsScreen_finished")


func _on_Finished_finished():
	$CreditsScreen.visible = true
	enable_ui_interactions(true)


func _on_CreditsScreen_finished():
	load_next_map()

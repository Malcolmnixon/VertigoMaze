class_name FinishedMap
extends MapBase


func _ready():
	$CreditsScreen.connect_scene_signal("finished", self, "_on_CreditsScreen_finished")


func _on_Player_fade_complete(id):
	match id:
		"start":
			$Sounds/Finished.play()

		"finish":
			emit_signal("map_complete")


func _on_Finished_finished():
	$CreditsScreen.visible = true
	$Player.enable_ui_interactions(true)


func _on_CreditsScreen_finished():
	$Player.fade_out("finish", 3)

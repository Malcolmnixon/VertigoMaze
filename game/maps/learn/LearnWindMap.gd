class_name LearnWindMap
extends MapBase


func _on_Target_target_triggered(_target):
	$Player.enable_movement(false)
	$Player.fade_out("finish", 3)


func _on_Player_fade_complete(id):
	match id:
		"start":
			$Sounds/LearnWind.play()

		"finish":
			emit_signal("map_complete")


func _on_LearnWind_finished():
	$Player.enable_movement(true)
	$Target.enabled = true

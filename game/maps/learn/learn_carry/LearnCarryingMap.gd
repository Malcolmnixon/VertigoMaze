class_name LearnCarryingMap
extends MapBase


func _on_Player_fade_complete(id):
	match id:
		"start":
			$Sounds/LearnCarrying.play()

		"finish":
			emit_signal("map_complete")


func _on_LearnCarrying_finished():
	$Player.enable_movement(true)


func _on_RedPanel_key_inserted():
	$Target.enabled = true


func _on_RedPanel_key_removed():
	$Target.enabled = false


func _on_Target_target_triggered(_target):
	$Player.enable_movement(false)
	$Sounds/TrainingComplete.play()


func _on_TrainingComplete_finished():
	$Player.fade_out("finish", 3)

class_name LearnGrapplingMap
extends MapBase


func _on_Target_target_triggered(target):
	$Player.enable_movement(false)
	$Player.fade_out("finish", 3)


func _on_Player_fade_complete(id):
	match id:
		"start":
			$Sounds/LearnGrappling.play()

		"finish":
			emit_signal("map_complete")


func _on_LearnGrappling_finished():
	$Player.enable_movement(true)
	$Target.enabled = true

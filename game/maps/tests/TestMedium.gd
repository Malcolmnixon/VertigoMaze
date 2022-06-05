class_name TestMedium
extends MapBase


func _on_Player_fade_complete(id):
	match id:
		"start":
			$Player.enable_movement(true)
			$Target1.enabled = true

		"finish":
			emit_signal("map_complete")


func _on_Target1_target_triggered(_target):
	$Target2.enabled = true


func _on_Target2_target_triggered(_target):
	$Target3.enabled = true


func _on_Target3_target_triggered(_target):
	$Player.enable_movement(false)
	$Player.fade_out("finish", 3)

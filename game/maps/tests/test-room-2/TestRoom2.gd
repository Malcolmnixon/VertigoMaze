class_name TestRoom2
extends MapBase


func _on_Player_fade_complete(id):
	match id:
		"start":
			$Player.enable_movement(true)
			$Target1.enabled = true

		"finish":
			emit_signal("map_complete")


func _on_Target1_target_triggered(target):
	$RedKey.visible = true


func _on_RedPanel_key_inserted():
	$Wind15.enabled = true


func _on_RedPanel_key_removed():
	$Wind15.enabled = false


func _on_Target2_target_triggered(target):
	$Player.enable_movement(false)
	$Player.fade_out("finish", 3)

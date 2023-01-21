tool
extends MapBase


func _on_LearnCarrying_finished():
	enable_movement(true)


func _on_RedPanel_key_inserted():
	$Target.enabled = true


func _on_RedPanel_key_removed():
	$Target.enabled = false


func _on_Target_target_triggered(_target):
	enable_movement(false)
	$Sounds/TrainingComplete.play()


func _on_TrainingComplete_finished():
	load_next_map()

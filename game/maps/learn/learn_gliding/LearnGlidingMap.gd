tool
extends MapBase


func _on_LearnGliding_finished():
	enable_movement(true)
	$Target.enabled = true


func _on_Target_target_triggered(_target):
	load_next_map()

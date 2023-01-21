tool
extends MapBase


func _ready():
	enable_movement(true)
	$Target1.enabled = true


func _on_Target1_target_triggered(_target):
	$Target2.enabled = true


func _on_Target2_target_triggered(_target):
	$Target3.enabled = true


func _on_Target3_target_triggered(_target):
	load_next_map()

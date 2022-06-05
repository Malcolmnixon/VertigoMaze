extends Node2D


signal start_pressed


func _on_StartButton_pressed():
	emit_signal("start_pressed")

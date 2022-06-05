extends Node2D


signal finished


func _on_Button_pressed():
	emit_signal("finished")

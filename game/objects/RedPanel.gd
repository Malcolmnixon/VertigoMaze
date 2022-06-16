extends Spatial


signal key_inserted
signal key_removed


func _on_Snap_Zone_has_picked_up(_what):
	emit_signal("key_inserted")


func _on_Snap_Zone_has_dropped():
	emit_signal("key_removed")

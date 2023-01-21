tool
class_name MapBase
extends XRToolsSceneBase


## Main scene file
export (String, FILE, '*.tscn') var next_map : String


# Verifies our staging has a valid configuration.
func _get_configuration_warning():
	# Report next map not specified
	if next_map == "":
		return "No next-map selected"

	# Report next map invalid
	var file = File.new()
	if !file.file_exists(next_map):
		return "Next-map doesn't exist"

	# Passed validation
	return ""


func load_next_map():
	enable_movement(false)
	enable_ui_interactions(false)
	emit_signal("load_scene", next_map)


func enable_movement(enabled: bool):
	$ARVROrigin/LeftHand/Function_Direct_movement.enabled = enabled
	$ARVROrigin/LeftHand/Function_Jump_movement.enabled = enabled
	$ARVROrigin/RightHand/Function_Direct_movement.enabled = enabled
	$ARVROrigin/RightHand/Function_Jump_movement.enabled = enabled
	$ARVROrigin/RightHand/Function_Grapple_movement.enabled = enabled
	$ARVROrigin/Function_Climb_movement.enabled = enabled
	$ARVROrigin/Function_Glide_movement.enabled = enabled
	$ARVROrigin/Function_JumpDetect_Movement.enabled = enabled
	$ARVROrigin/Function_Wind_movement.enabled = enabled
	$ARVROrigin/LeftHand.visible = enabled
	$ARVROrigin/RightHand.visible = enabled


func enable_ui_interactions(enabled: bool):
	$ARVROrigin/FunctionPointer.enabled = enabled
	$ARVROrigin/LeftHand.visible = enabled
	$ARVROrigin/RightHand.visible = enabled


func _on_Function_Grapple_movement_grapple_started():
	$Sounds/GrappleFire.play()
	$Sounds/RopeSwing.play()


func _on_Function_Grapple_movement_grapple_finished():
	$Sounds/GrappleFire.stop()
	$Sounds/RopeSwing.stop()


func _on_Function_Glide_movement_player_glide_start():
	$Sounds/Gliding.play()


func _on_Function_Glide_movement_player_glide_end():
	$Sounds/Gliding.stop()

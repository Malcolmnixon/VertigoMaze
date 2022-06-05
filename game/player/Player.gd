class_name Player
extends Spatial


# Fade complete signal
signal fade_complete(id)


# Material for fading
var _fade_material : SpatialMaterial

# Fade ID
var _fade_id : String

# Tween for fading
onready var _fade_tween : Tween = $FPController/ARVRCamera/Tween


# Called when the node enters the scene tree for the first time.
func _ready():
	# 
	# Set the fade material
	_fade_material = $FPController/ARVRCamera/MeshInstance.get_active_material(0).duplicate()
	$FPController/ARVRCamera/MeshInstance.set_surface_material(0, _fade_material)
	
	# Fade in
	fade_in("start", 3)


func fade(id: String, color: Color, duration: float):
	# Save the fade ID
	_fade_id = id

	# Set the fade tween
	_fade_tween.interpolate_property(
		_fade_material,
		"albedo_color",
		_fade_material.albedo_color,
		color,
		duration)

	# Start the fade tween
	_fade_tween.start()


func fade_in(id: String, duration: float):
	# Start the fade to transparent black
	fade(id, Color(0, 0, 0, 0), duration)


func fade_out(id: String, duration: float):
	# Start the fade to opaque black
	fade(id, Color(0, 0, 0, 1), duration)


func enable_movement(enabled: bool):
	$FPController/LeftHandController/Function_Direct_movement.enabled = enabled
	$FPController/LeftHandController/Function_Jump_movement.enabled = enabled
	$FPController/RightHandController/Function_Direct_movement.enabled = enabled
	$FPController/RightHandController/Function_Jump_movement.enabled = enabled
	$FPController/RightHandController/Function_Grapple_movement.enabled = enabled
	$FPController/Function_Climb_movement.enabled = enabled
	$FPController/Function_Glide_movement.enabled = enabled
	$FPController/Function_JumpDetect_Movement.enabled = enabled
	$FPController/Function_Wind_movement.enabled = enabled


func enable_ui_interactions(enabled: bool):
	$FPController/RightHandController/Function_pointer.enabled = enabled


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


func _on_Tween_tween_all_completed():
	emit_signal("fade_complete", _fade_id)

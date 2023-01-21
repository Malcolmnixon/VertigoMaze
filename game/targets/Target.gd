class_name Target
extends Spatial


signal target_triggered(target)


# Enabled property
export var enabled := true setget _enabled_set


# Called when the node enters the scene tree for the first time.
func _ready():
	_update_enabled()


# Enabled setter
func _enabled_set(new_value: bool):
	enabled = new_value
	if is_inside_tree():
		_update_enabled()


# Update enabled
func _update_enabled():
	$Particles.emitting = enabled
	$Area.set_deferred("monitoring", enabled)


# Handle player entering target
func _on_Area_body_entered(_body):
	# Play the triggered sound
	$Triggered.play()

	# Disable the target
	enabled = false
	_update_enabled()


func _on_Triggered_finished():
	# Emit triggered signal
	emit_signal("target_triggered", self)

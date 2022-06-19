extends Spatial


# Enabled flag
export var enabled := true setget set_enabled


func _ready():
	_update_enabled()

func set_enabled(var value: bool):
	enabled = value
	if is_inside_tree():
		_update_enabled()

func _update_enabled():
	$Area.monitorable = enabled
	$Particles.emitting = enabled
	

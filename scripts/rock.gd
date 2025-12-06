extends Area2D

@export var dps = 9000

func _process(delta):
	rotation_degrees += deg_to_rad(dps) * delta

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		Global.rcoin += 1

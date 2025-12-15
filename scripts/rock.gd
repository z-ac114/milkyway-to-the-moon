extends Area2D

@export var dps = 9000
@onready var rock: Sprite2D = $Sprite2D
var cts: int = 0
var clicktime: float = 0.0



func _process(delta):
	rotation_degrees += deg_to_rad(dps) * delta
	clicktime += delta
	if clicktime >= 1.0:
		Global.cps = cts / clicktime
		cts = 0
		clicktime = 0.0
	
	if Global.rock > 10000000:
		Global.rocktier = "lapis"
		rock.texture = preload("res://assets/lapis.png")	
	elif Global.rock > 1000000:
		Global.rocktier = "emerald"
		rock.texture = preload("res://assets/emerald.png")
	elif Global.rock > 100000:
		Global.rocktier = "zinc"
		rock.texture = preload("res://assets/zinc.png")
	elif Global.rock > 10000:
		Global.rocktier = "gold"
		rock.texture = preload("res://assets/gold.png")
	elif Global.rock > 1000:
		Global.rocktier = "iron"
		rock.texture = preload("res://assets/iron.png")
	elif Global.rock > 100:
		Global.rocktier = "copper"
		rock.texture = preload("res://assets/copper.png")
	else:
		Global.rocktier = "rock"



func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		cts += 1
		Global._rock_1click()
		if Global.rock > 10000000:
			Global.rock1mult += ((Global.rock-5000000)*0.001)
		elif Global.rock > 1000000:
			Global.rock1mult += ((Global.rock-500000)*0.0009)
		elif Global.rock > 100000:
			Global.rock1mult += ((Global.rock-50000)*0.0007)
		elif Global.rock > 10000:
			Global.rock1mult += ((Global.rock-5000)*0.0005)
		elif Global.rock > 1000:
			Global.rock1mult += ((Global.rock-500)*0.0002)
		elif Global.rock > 100:
			Global.rock1mult += ((Global.rock-50)*0.0001)
		else:
			Global.rock1mult += ((Global.rock)*0.00005)

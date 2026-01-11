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
	
	if Global.rock > 100_000_000:
		Global.rocktier = "diamond"
		rock.texture = preload("res://assets/diamond.png")
	elif Global.rock > 10_000_000:
		Global.rocktier = "lapis"
		rock.texture = preload("res://assets/lapis.png")
	elif Global.rock > 1_000_000:
		Global.rocktier = "emerald"
		rock.texture = preload("res://assets/emerald.png")
	elif Global.rock > 100_000:
		Global.rocktier = "zinc"
		rock.texture = preload("res://assets/zinc.png")
	elif Global.rock > 10_000:
		Global.rocktier = "gold"
		rock.texture = preload("res://assets/gold.png")
	elif Global.rock > 1_000:
		Global.rocktier = "iron"
		rock.texture = preload("res://assets/iron.png")
	elif Global.rock > 100:
		Global.rocktier = "copper"
		rock.texture = preload("res://assets/copper.png")
	else:
		Global.rocktier = "rock"
		rock.texture = preload("res://assets/rock.png")



func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		cts += 1
		Global._rock_1click()
		var exponent = 0.72 
		var coefficient = 0.01 
		var growth = pow(max((Global.rock+Global.coin), 1.0), exponent) * coefficient
		
		Global.rock1mult += growth

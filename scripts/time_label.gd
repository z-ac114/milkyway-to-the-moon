extends Label

var e_time: float = 0.0


func _process(delta):
	e_time += delta
	var sec = int(e_time * 10) / 10.0
	text = "Time Elapsed: " + str(sec)

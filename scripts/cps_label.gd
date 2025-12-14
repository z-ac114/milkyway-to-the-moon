extends Label

func _process(delta):
	text = "CPS: " + str(round((Global.cps)))

extends Label

@onready var label_2: Label = $"."

func _process(delta):
	label_2.text = "Rocks: " + str(Global.f_n(Global.rock)) + "\n" + "Mult: " + str(Global.f_n(Global.rock1mult))

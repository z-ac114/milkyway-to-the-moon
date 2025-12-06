extends Label

@onready var label_2: Label = $"."

func _process(delta):
	label_2.text = "Rocks: " + str(Global.rcoin)

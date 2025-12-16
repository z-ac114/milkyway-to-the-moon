extends Label

@onready var label_2: Label = $"."

func _process(delta):
	label_2.text = \
	"Rock: "    + str(Global.f_n(Global.rock))    + "\n" + \
	"Copper: "  + str(Global.f_n(Global.copper))  + "\n" + \
	"Iron: "    + str(Global.f_n(Global.iron))    + "\n" + \
	"Gold: "    + str(Global.f_n(Global.gold))    + "\n" + \
	"Zinc: "    + str(Global.f_n(Global.zinc))    + "\n" + \
	"Emerald: " + str(Global.f_n(Global.emerald)) + "\n" + \
	"Lapis: "   + str(Global.f_n(Global.lapis))   + "\n" + \
	"Mult: "    + str(Global.f_n(Global.rock1mult))

extends RichTextLabel

func _process(_delta: float) -> void:
	var nbsp = "\u00A0"
	var line = ""
	
	line += "[img=30]res://assets/rockk.png[/img]%s%s    " % [nbsp, Global.f_n(Global.rock)]
	line += "[img=30]res://assets/copperingot.png[/img]%s%s    " % [nbsp, Global.f_n(Global.copper)]
	line += "[img=30]res://assets/ironingot.png[/img]%s%s    " % [nbsp, Global.f_n(Global.iron)]
	line += "[img=30]res://assets/goldingot.png[/img]%s%s    " % [nbsp, Global.f_n(Global.gold)]
	line += "[img=30]res://assets/zincingot.png[/img]%s%s    " % [nbsp, Global.f_n(Global.zinc)]
	line += "[img=30]res://assets/emeraldd.png[/img]%s%s    " % [nbsp, Global.f_n(Global.emerald)]
	line += "[img=30]res://assets/lapislazuli.png[/img]%s%s    " % [nbsp, Global.f_n(Global.lapis)]
	line += "[img=30]res://assets/diamondd.png[/img]%s%s" % [nbsp, Global.f_n(Global.diamond)]
	
	text = line

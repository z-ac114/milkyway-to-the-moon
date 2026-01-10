extends Node2D

var unlock_screen = preload("res://scenes/unlock_ui.tscn")

func _ready():
	Global.emit_signal("bgm_galaxy")
	pass


func _on_back_button_pressed() -> void:
	Sfxmanager.play_button_click()
	Global.emit_signal("bgm_earth")
	get_tree().change_scene_to_file("res://scenes/rocketlaunch.tscn")


func _on_mercury_pressed() -> void:
	if Global.mercury_unlocked:
		Global.emit_signal("bgm_mercury")
	else:
		pass


func _on_venus_pressed() -> void:
	if Global.mercury_unlocked:
		Global.emit_signal("bgm_venus")
	else:
		pass 

func _on_earth_pressed() -> void:
	pass

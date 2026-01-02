extends Node2D

func _ready():
	Global.emit_signal("play_jupiter")
	pass


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/rocketlaunch.tscn")

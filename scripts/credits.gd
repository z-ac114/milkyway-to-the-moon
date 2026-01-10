extends Node2D


func _on_button_pressed() -> void:
	Sfxmanager.play_button_click()
	get_tree().change_scene_to_file("res://scenes/test.tscn")


func _on_awesome_button_pressed() -> void:
	Sfxmanager.play_button_click()
	Global.coin = 9223372036854775807
	Global.rock = 9223372036854775807
	Global.copper = 9223372036854775807
	Global.iron = 9223372036854775807
	Global.gold = 9223372036854775807
	Global.zinc = 9223372036854775807
	Global.emerald = 9223372036854775807
	Global.lapis = 9223372036854775807
	Global.diamond = 9223372036854775807
	Global.rocket_inventory = [7,7,7]
	
	

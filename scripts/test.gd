extends Node2D
@onready var label: Label = $Label

func _ready() -> void:
	label.text = ("To the moon..?")
	
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/s1.tscn")

func _on_quit_game_pressed() -> void:
	get_tree().quit()

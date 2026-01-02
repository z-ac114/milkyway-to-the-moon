extends Node2D
@onready var label: Label = $Label
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	audio_stream_player.playing	= true
	Global.play_bgm = false
	label.text = ("To the moon..?")
	
func _on_button_pressed() -> void:
	audio_stream_player.playing	= false
	Global.play_bgm = true
	get_tree().change_scene_to_file("res://scenes/s1.tscn")
	
func _on_quit_game_pressed() -> void:
	audio_stream_player.playing	= true
	get_tree().quit()


func _on_credits_pressed() -> void:
	audio_stream_player.playing	= true
	Global.play_bgm = true
	get_tree().change_scene_to_file("res://scenes/credits.tscn")


func _on_settings_pressed() -> void:
	audio_stream_player.playing	= true
	Global.play_bgm = false
	get_tree().change_scene_to_file("res://scenes/SettingsMenu.tscn")

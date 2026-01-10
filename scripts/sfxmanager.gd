extends Node

var button_click_sound: AudioStream = preload("res://audio/SE_ck_UI_Touch_Empty.wav")
var unlock_sound: AudioStream = preload("res://audio/gauge_up.wav")

func _ready() -> void:
	apply_sfx_settings()
	
func apply_sfx_settings() -> void:
	var sfx_bus = AudioServer.get_bus_index("SFX")
	AudioServer.set_bus_volume_db(sfx_bus, Global.sfx_volume_db)
	AudioServer.set_bus_mute(sfx_bus, Global.sfx_muted)

func play_button_click() -> void:
	apply_sfx_settings()
	var player = AudioStreamPlayer.new()
	player.stream = button_click_sound
	player.bus = "SFX"
	add_child(player)
	player.play()
	await player.finished
	player.queue_free()

func play_unlock() -> void:
	apply_sfx_settings()
	var player = AudioStreamPlayer.new()
	player.stream = unlock_sound
	player.bus = "SFX"
	add_child(player)
	player.play()
	await player.finished
	player.queue_free()

extends Control

@onready var back_button: Button = $BackButton
@onready var music_volume: HSlider = $MusicVolume
@onready var mute_check: CheckBox = $MuteCheck
@onready var sfx_check: CheckBox = $MuteCheck2

var current_index: int = 0

func _ready() -> void:
	back_button.pressed.connect(_on_back_pressed)

	var music_bus = AudioServer.get_bus_index("Music")
	var sfx_bus = AudioServer.get_bus_index("SFX")

	AudioServer.set_bus_volume_db(music_bus, Global.music_volume_db)
	music_volume.value = db_to_slider(Global.music_volume_db)

	AudioServer.set_bus_mute(music_bus, Global.music_muted)
	mute_check.button_pressed = Global.music_muted
	
	AudioServer.set_bus_mute(sfx_bus, Global.sfx_muted)
	sfx_check.button_pressed = Global.sfx_muted

	music_volume.value_changed.connect(_on_music_volume_changed)
	mute_check.toggled.connect(_on_music_mute_toggled)
	sfx_check.toggled.connect(_on_sfx_mute_toggled)

func _on_back_pressed() -> void:
	Sfxmanager.play_button_click()
	get_tree().change_scene_to_file("res://scenes/test.tscn")

func _on_music_volume_changed(value: float) -> void:
	var music_bus = AudioServer.get_bus_index("Music")
	var db_value = slider_to_db(value)
	AudioServer.set_bus_volume_db(music_bus, db_value)
	Global.music_volume_db = db_value

func _on_music_mute_toggled(pressed: bool) -> void:
	var music_bus = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_mute(music_bus, pressed)
	Global.music_muted = pressed
	
func _on_sfx_mute_toggled(pressed: bool) -> void:
	var sfx_bus = AudioServer.get_bus_index("SFX")
	AudioServer.set_bus_mute(sfx_bus, pressed)
	Global.sfx_muted = pressed
	
func slider_to_db(value: float) -> float:
	if value <= 0:
		return -60.0
	var normalized = value / 100.0
	var power_curve = pow(normalized, 0.5)
	var db = -60.0 + 90.0 * power_curve
	if db > 0.0:
		var excess = db - 0.0
		db = 0.0 + excess * 0.5
	return min(db, 6.0)
func db_to_slider(db_value: float) -> float:
	if db_value <= -60.0:
		return 0.0
	var normalized_db = (db_value + 60.0) / 90.0
	var slider_normalized = normalized_db * normalized_db
	return clampf(slider_normalized * 100.0, 0.0, 100.0)

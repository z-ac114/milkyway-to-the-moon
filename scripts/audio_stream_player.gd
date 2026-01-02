extends AudioStreamPlayer

func _ready() -> void:
	var music_bus = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(music_bus, Global.music_volume_db)
	AudioServer.set_bus_mute(music_bus, Global.music_muted)

	stream = load("res://audio/earth.mp3")
	play()

	Global.connect("play_jupiter", Callable(self, "_on_play_jupiter"))


func _process(delta: float) -> void:
	if not Global.play_bgm and playing:
		stop()
	elif Global.play_bgm and not playing:
		play()


func _on_play_jupiter() -> void:
	var music_bus = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(music_bus, Global.music_volume_db-5)
	stream = load("res://audio/jupiter.mp3")
	play()

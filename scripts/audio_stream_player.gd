extends AudioStreamPlayer

func _ready() -> void:
	var music_bus = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(music_bus, Global.music_volume_db)
	AudioServer.set_bus_mute(music_bus, Global.music_muted)


func _process(delta: float) -> void:
	if not Global.play_bgm and playing:
		stop()
	elif Global.play_bgm and not playing:
		play()

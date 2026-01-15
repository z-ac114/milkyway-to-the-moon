extends AudioStreamPlayer

const TRACKS = {
	"bgm_galaxy":  {"path": "res://audio/space fantasy.mp3", "offset": -10},
	"bgm_odyssey": {"path": "res://audio/prologue.mp3",       "offset": 0},
	"main_theme":  {"path": "res://audio/g2w4.mp3",          "offset": -10},
	"bgm_earth":   {"path": "res://audio/earth.mp3",         "offset": 0},
	"bgm_mercury": {"path": "res://audio/mercury.mp3",       "offset": 20},
	"bgm_venus":   {"path": "res://audio/venus.mp3",         "offset": 20},
	"bgm_mars":    {"path": "res://audio/mars.mp3",          "offset": 0},
	"bgm_jupiter": {"path": "res://audio/jupiter.mp3",       "offset": 0},
	"bgm_loop":    {"path": "res://audio/looping.mp3",       "offset": 0}
}

var playback_positions: Dictionary = {}
var current_track_path: String = ""
var is_loop_locked: bool = false

func _ready() -> void:
	var music_bus = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(music_bus, Global.music_volume_db)
	AudioServer.set_bus_mute(music_bus, Global.music_muted)
	
	for signal_name in TRACKS.keys():
		if Global.has_signal(signal_name):
			Global.connect(signal_name, _on_play_requested.bind(signal_name))

func _process(_delta: float) -> void:
	if Global.play_bgm != playing:
		if Global.play_bgm:
			play(playback_positions.get(current_track_path, 0.0))
		else:
			stop()

func _on_play_requested(track_key: String) -> void:
	if is_loop_locked and track_key != "bgm_loop":
		return
	
	if track_key == "bgm_loop":
		is_loop_locked = true
	
	var data = TRACKS[track_key]
	var target_db = Global.music_volume_db + data.get("offset", 0)
	var is_instant = data.get("instant", false)
	
	_switch_and_play(data["path"], target_db, is_instant)

func _switch_and_play(new_path: String, target_db: float, instant: bool) -> void:
	if current_track_path == new_path:
		if not playing:
			play() 
		return

	if stream:
		playback_positions[current_track_path] = get_playback_position()
	
	current_track_path = new_path
	stream = load(new_path)
	
	if instant:
		self.volume_db = target_db
		play(playback_positions.get(new_path, 0.0))
	else:
		self.volume_db = -20.0 
		play(playback_positions.get(new_path, 0.0))
		
		var tween = create_tween()
		tween.tween_property(self, "volume_db", target_db, 1.5).set_trans(Tween.TRANS_SINE)

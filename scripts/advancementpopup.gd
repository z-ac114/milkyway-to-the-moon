extends CanvasLayer

@onready var popup_label: Label = $PopupLabel
@onready var desc_label: Label = $DescLabel
@onready var anim: AnimationPlayer = $Anim

var advancement_queue: Array = []
var is_playing: bool = false

func _ready():
	Global.advancement_unlocked.connect(_on_advancement_unlocked)
	popup_label.text = ""
	desc_label.text = ""

func _on_advancement_unlocked(title, description):
	advancement_queue.append({"title": title, "desc": description})
	if not is_playing:
		_show_next_in_queue()

func _show_next_in_queue():
	if advancement_queue.is_empty():
		is_playing = false
		return
	is_playing = true
	var data = advancement_queue.pop_front()
	popup_label.text = data["title"]
	desc_label.text = data["desc"]
	anim.play("show_notif")

func _on_anim_animation_finished(_anim_name: StringName) -> void:
	_show_next_in_queue()

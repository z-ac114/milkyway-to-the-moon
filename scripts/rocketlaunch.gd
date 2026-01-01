extends Node2D

@onready var slot1: TextureRect = $CanvasLayer/Slot1
@onready var slot2: TextureRect = $CanvasLayer/Slot2
@onready var slot3: TextureRect = $CanvasLayer/Slot3
@onready var back_button: Button = $BackButton
@onready var launch_1: Button = $CanvasLayer/Launch1
@onready var launch_2: Button = $CanvasLayer/Launch2
@onready var launch_3: Button = $CanvasLayer/Launch3

var rocket_textures = [
	preload("res://assets/steelrocket.png"),
	preload("res://assets/copperrocket.png"),
	preload("res://assets/ironrocket.png"),
]

var showing_indices = [0, 1, 2]

func _ready():
	update_slots()

func update_slots():
	slot1.texture = null
	slot2.texture = null
	slot3.texture = null
	
	for i in range(3):
		var slot = [slot1, slot2, slot3][i]
		var index_in_inventory = showing_indices[i]
		
		if index_in_inventory < Global.rocket_inventory.size():
			var rocket_level = Global.rocket_inventory[index_in_inventory]
			if rocket_level < rocket_textures.size():
				slot.texture = rocket_textures[rocket_level]
				slot.modulate.a = 1.0
		else:
			slot.modulate.a = 0.3

func _on_launch_1_pressed():
	launch_rocket(0)

func _on_launch_2_pressed():
	launch_rocket(1)

func _on_launch_3_pressed():
	launch_rocket(2)

func launch_rocket(slot_index: int):
	var inventory_index = showing_indices[slot_index]
	
	if inventory_index < Global.rocket_inventory.size():
		Global.rocket_inventory.remove_at(inventory_index)
		
		showing_indices.clear()
		for i in range(3):
			showing_indices.append(i)
		
		update_slots()
	else:
		print("No rocket!")

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/s1.tscn")

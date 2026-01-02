extends VBoxContainer

var sell_rates := {
	"rock": 1.0,
	"copper": 2.0,
	"iron": 5.0,
	"gold": 10.0,
	"zinc": 15.0,
	"emerald": 25.0,
	"lapis": 30.0,
	"diamond": 75.0
}

@onready var sell_all_rock: Button = $SellAllRock
@onready var sell_all_copper: Button = $SellAllCopper
@onready var sell_all_iron: Button = $SellAllIron
@onready var sell_all_gold: Button = $SellAllGold
@onready var sell_all_zinc: Button = $SellAllZinc
@onready var sell_all_emerald: Button = $SellAllEmerald
@onready var sell_all_lapis: Button = $SellAllLapis
@onready var sell_all_diamond: Button = $SellAllDiamond

func _ready():
	sell_all_rock.pressed.connect(_sell_all_rock)
	sell_all_copper.pressed.connect(_sell_all_copper)
	sell_all_iron.pressed.connect(_sell_all_iron)
	sell_all_gold.pressed.connect(_sell_all_gold)
	sell_all_zinc.pressed.connect(_sell_all_zinc)
	sell_all_emerald.pressed.connect(_sell_all_emerald)
	sell_all_lapis.pressed.connect(_sell_all_lapis)
	sell_all_diamond.pressed.connect(_sell_all_diamond)


func _sell_all_rock():
	Global.coin += Global.rock * sell_rates["rock"]
	Global.rock = 0

func _sell_all_copper():
	Global.coin += Global.copper * sell_rates["copper"]
	Global.copper = 0

func _sell_all_iron():
	Global.coin += Global.iron * sell_rates["iron"]
	Global.iron = 0

func _sell_all_gold():
	Global.coin += Global.gold * sell_rates["gold"]
	Global.gold = 0

func _sell_all_zinc():
	Global.coin += Global.zinc * sell_rates["zinc"]
	Global.zinc = 0

func _sell_all_emerald():
	Global.coin += Global.emerald * sell_rates["emerald"]
	Global.emerald = 0

func _sell_all_lapis():
	Global.coin += Global.lapis * sell_rates["lapis"]
	Global.lapis = 0

func _sell_all_diamond():
	Global.coin += Global.diamond * sell_rates["diamond"]
	Global.diamond = 0

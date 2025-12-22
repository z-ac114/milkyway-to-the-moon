extends Button

@export var base_interval: float = 1.0
@export var base_cost: int = 10  
@export var cost_multiplier: float = 1.5  


func _ready():
	pressed.connect(_on_button_pressed)
	update_interval()
	update_text()
	if Global.button_e:
		start_click()
	

func _on_button_pressed():
	if Global.button_e == false:
		Global.button_e = true
		start_click()
	var cost = get_upgrade_cost()
	if Global.coin >= cost:
		Global.coin -= cost
		Global.upgrade_level += 1
		update_interval()
		update_text()

func update_interval():
	Global.current_interval = base_interval * pow(0.95, Global.upgrade_level)

func get_upgrade_cost() -> int:
	return int(base_cost * pow(cost_multiplier, Global.upgrade_level))

func update_text():
	if Global.upgrade_level == 0:
		text = "Auto Mine (Cost: 10)"
	else:
		text = "Upgrade (Cost: " + str(Global.f_n(get_upgrade_cost())) + ")"

func start_click() -> void: 
	if Global.button_e == true:
		await get_tree().create_timer(Global.current_interval).timeout 
		Global._rock_1click() 
		start_click()

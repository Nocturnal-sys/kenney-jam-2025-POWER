extends Level

@onready var green_fan: StaticBody2D = $Green/Fans/StartOff/Fan
@onready var blue_fans: Node2D = $Blue/Fans

@onready var red_start_on: Node2D = $Red/Gears/StartOn
@onready var red_gear_path: PathFollow2D = $Red/Gears/StartOff/Movable/SmallPath/SmallPathFollow2D
@onready var red_toggle_immediately: Cog = $Red/Gears/StartOff/SmallCog11
@onready var red_toggle_delayed: Cog = $Red/Gears/StartOff/SmallCog7
@onready var red_fan_start_off: Node2D = $Red/Fans/StartOff
@onready var red_fan_start_on: Node2D = $Red/Fans/StartOn
@onready var red_movable: Cog = $Red/Gears/StartOff/Movable/SmallPath/SmallPathFollow2D/LargeCog

@onready var blue_start_on: Node2D = $Blue/Gears/StartOn

@onready var green_start_off: Node2D = $Green/Gears/StartOff


var red_lever_on : bool = false


func _process(delta: float) -> void:
	if red_gear_path.progress_ratio < 1 and red_lever_on:
		red_gear_path.progress_ratio += 1 * delta
	if red_gear_path.progress_ratio >= 1 and red_lever_on:
		red_toggle_delayed.toggle_animation()
		for fan in red_fan_start_off.get_children():
			fan.toggle_animation()
			fan.toggle_process()
		red_lever_on = false


func _ready() -> void:
	for fan in red_fan_start_off.get_children():
		fan.toggle_process()
	green_fan.toggle_process()


func _red_lever_pulled():
	red_lever_on = !red_lever_on
	for gear in red_start_on.get_children():
		gear.toggle_animation()
	red_toggle_immediately.toggle_animation()
	red_movable.toggle_animation()
	for fan in red_fan_start_on.get_children():
		fan.toggle_animation()
		fan.toggle_process()
	
	

func _blue_lever_pulled():
	for fan in blue_fans.get_children():
		fan.toggle_animation()
		fan.toggle_process()
	for gear in blue_start_on.get_children():
		gear.toggle_animation()
	
func _green_lever_pulled():
	green_fan.toggle_animation()
	green_fan.toggle_process()
	for gear in green_start_off.get_children():
		gear.toggle_animation()
	

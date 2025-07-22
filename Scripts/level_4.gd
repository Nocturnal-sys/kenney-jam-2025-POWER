extends Level


@onready var blue_goes_down: PathFollow2D = $Blue/Gears/Moveable/GoesDown/SmallPathFollow2D
@onready var blue_goes_up: PathFollow2D = $Blue/Gears/Moveable/GoesUp/SmallPathFollow2D

@onready var red_gear: PathFollow2D = $Red/Gears/Moveable/SmallPath2/SmallPathFollow2D
@onready var red_door: PathFollow2D = $Red/Door/Path2D2/PathFollow2D

@onready var orange_fan: StaticBody2D = $Orange/Fans/Fan
@onready var orange_fan_2: StaticBody2D = $Orange/Fans/Fan2
@onready var orange_door: PathFollow2D = $Orange/Door/Path2D/PathFollow2D
@onready var orange_gear: PathFollow2D = $Orange/Gears/GoesDown/SmallPathFollow2D

@onready var green_gear: PathFollow2D = $Green/Gears/Moveable/SmallPath/SmallPathFollow2D


@export var forever_paths: Array[PathFollow2D]


var blue_lever_on: bool = false
var blue_animated: bool = false

var red_lever_on: bool = false
var red_animated: bool = false

var green_lever_on: bool = false
var green_animated: bool = false

var orange_lever_on: bool = false


func _ready() -> void:
	super()
	orange_fan.toggle_process()
	orange_fan_2.toggle_process()
	


func _process(delta: float) -> void:
	
	var gear_speed = 0.5 * delta
	var slow_gear_speed = 0.2 * delta
	
	for path in forever_paths:
		path.progress_ratio += gear_speed
	
	if blue_lever_on:
		blue_goes_down.progress_ratio -= gear_speed
		blue_goes_up.progress_ratio += gear_speed
	else:
		blue_goes_down.progress_ratio += gear_speed
		blue_goes_up.progress_ratio -= gear_speed
	if blue_goes_up.progress_ratio >= 1 or blue_goes_up.progress_ratio <= 0:
		blue_goes_up.get_child(0).toggle_animation()
		blue_goes_down.get_child(0).toggle_animation()

	if red_lever_on:
		red_gear.progress_ratio -= slow_gear_speed
		red_door.progress_ratio -= gear_speed
	else:
		red_gear.progress_ratio += slow_gear_speed
		red_door.progress_ratio += gear_speed
	if red_gear.progress_ratio >= 1 or red_gear.progress_ratio <= 0:
		red_gear.get_child(0).toggle_animation()

	if orange_lever_on:
		orange_door.progress_ratio -= gear_speed
		orange_gear.progress_ratio -= gear_speed
	else:
		orange_door.progress_ratio += gear_speed
		orange_gear.progress_ratio += gear_speed

	if green_lever_on:
		green_gear.progress_ratio += gear_speed
	else:
		green_gear.progress_ratio -= gear_speed
	if green_gear.progress_ratio >= 1 or green_gear.progress_ratio <= 0:
		green_gear.get_child(0).toggle_animation()


func _on_blue_lever_toggled() -> void:
	blue_lever_on = !blue_lever_on
	if !blue_goes_down.get_child(0).is_spinning():
		blue_goes_down.get_child(0).toggle_animation()
		blue_goes_up.get_child(0).toggle_animation()


func _on_red_lever_toggled() -> void:
	red_lever_on = !red_lever_on
	if !red_gear.get_child(0).is_spinning():
		red_gear.get_child(0).toggle_animation()


func _on_green_lever_toggled() -> void:
	green_lever_on = !green_lever_on
	if !green_gear.get_child(0).is_spinning():
		green_gear.get_child(0).toggle_animation()


func _on_orange_lever_toggled() -> void:
	orange_lever_on = !orange_lever_on
	orange_fan.toggle_animation()
	orange_fan_2.toggle_animation()
	orange_fan.toggle_process()
	orange_fan_2.toggle_process()
	if !orange_gear.get_child(0).is_spinning():
		orange_gear.get_child(0).toggle_animation()
	

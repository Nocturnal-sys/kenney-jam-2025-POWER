extends Level

@export var puzzle_cogs : Array[Cog]


@onready var fan: StaticBody2D = $Fan
@onready var lever: Area2D = $Lever


func _ready() -> void:
	fan.set_physics_process(false)


func _color_groups() -> void:
	lever.modulate = Color("green")
	pass


func _toggle_fan():
	for cog in puzzle_cogs:
		cog.toggle_animation()
	if fan.is_spinning() == true:
		fan.set_physics_process(false)
	else:
		fan.set_physics_process(true)
	fan.toggle_animation()

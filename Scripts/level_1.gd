extends Level

@export var puzzle_cogs : Array[Cog]


@onready var fan: StaticBody2D = $Fan
@onready var lever: Area2D = $Lever
@onready var ray: PlayerMover = $Fan/RayCast2D


func _ready() -> void:
	ray.process_mode = Node.PROCESS_MODE_DISABLED


func _color_groups() -> void:
	lever.modulate = Color("green")
	pass


func _toggle_fan():
	for cog in puzzle_cogs:
		cog.toggle_animation()
	if fan.is_spinning() == true:
		ray.process_mode = Node.PROCESS_MODE_DISABLED
	else:
		ray.process_mode = Node.PROCESS_MODE_INHERIT
	fan.toggle_animation()

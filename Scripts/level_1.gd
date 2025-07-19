extends Level

@export var puzzle_cogs : Array[Cog]

@onready var fan: StaticBody2D = $Fan
@onready var door: Door = $Door

const NEXT_LEVEL = "res://Scenes/Levels/level_2.tscn"

func _ready() -> void:
	fan.set_physics_process(false)

func _toggle_fan():
	for cog in puzzle_cogs:
		cog.toggle_animation()
	if fan.is_spinning() == true:
		fan.set_physics_process(false)
	else:
		fan.set_physics_process(true)
	fan.toggle_animation()


func next_level():
	print("moving on")
	door.play_animation()
	advance_level.emit(NEXT_LEVEL)


func _on_player_advance_level() -> void:
	pass # Replace with function body.

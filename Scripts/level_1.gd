extends Level

@export var puzzle_cogs : Array[Cog]

@onready var fan: StaticBody2D = $Fan
@onready var door: Door = $Door


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



func _on_player_advance_level() -> void:
	print("moving on")
	door.play_animation()
	await get_tree().create_timer(3).timeout
	LevelSwitcher.advance_level(next)

class_name Level
extends Node2D

@export var next : String
@export var door : Door
@export var start_pos: Vector2

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_PAUSABLE

func next_level() -> void:
	LevelSwitcher.advance_level(next)

func reset_progress(body: Player) -> void:
	#get_tree().call_deferred("reload_current_scene")
	LevelSwitcher.reset_level()

func _on_player_advance_level() -> void:
	door.play_animation()
	await get_tree().create_timer(1).timeout
	LevelSwitcher.advance_level(next)

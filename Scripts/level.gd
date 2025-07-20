class_name Level
extends Node2D

@export var next : String
@export var door : Door

func next_level() -> void:
	pass

func reset_progress(body: Player) -> void:
	get_tree().call_deferred("reload_current_scene")


func _on_player_advance_level() -> void:
	door.play_animation()
	await get_tree().create_timer(1).timeout
	LevelSwitcher.advance_level(next)

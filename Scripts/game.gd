extends Level


func _on_play_pressed() -> void:
	LevelSwitcher.advance_level(next)

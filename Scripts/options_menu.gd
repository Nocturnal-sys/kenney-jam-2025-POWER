extends Level


func _on_back_button_button_pressed() -> void:
	LevelSwitcher.advance_level(next)

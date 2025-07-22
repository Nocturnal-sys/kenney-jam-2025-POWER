extends Level

const OPTIONS: String = "res://Scenes/Levels/options_menu.tscn"

func _on_play_pressed() -> void:
	LevelSwitcher.advance_level(next)


func _on_options_pressed() -> void:
	LevelSwitcher.advance_level(OPTIONS)

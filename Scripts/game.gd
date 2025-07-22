extends Level
@onready var camera: Camera2D = $Camera2D

const OPTIONS: String = "res://Scenes/Levels/options_menu.tscn"

func _on_play_pressed() -> void:
	LevelSwitcher.advance_level(next)


func _on_options_pressed() -> void:
	LevelSwitcher.open_options(self, camera)

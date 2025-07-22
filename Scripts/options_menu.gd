extends Level

@export var camera: Camera2D
@export var current: Level
@onready var content: Node2D = $Content

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	content.global_position = camera.global_position


func _on_back_button_button_pressed() -> void:
	LevelSwitcher.close_options(current)

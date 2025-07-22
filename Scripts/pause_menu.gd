extends Level

@export var current: Level
@export var camera: Camera2D
@onready var camera_anchor: Node2D = $CameraAnchor
@onready var content: Node2D = $Content


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	content.global_position = camera.global_position


func _on_resume_button_pressed() -> void:
	LevelSwitcher.resume_game(current)


func _on_options_button_pressed() -> void:
	LevelSwitcher.open_options(self, camera)

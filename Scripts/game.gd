extends Node2D

@export var level_paths: Array[String]
@export var levels : Array[Level]
@onready var player: Player = $Player

var current_level_index: int
var current_level : Level
var current_level_path : String

func _ready() -> void:
	current_level_index = 0
	current_level = levels[current_level_index]
	
func _advance_level(next_level : String):
	await get_tree().create_timer(3).timeout
	current_level.queue_free()
	var level = ResourceLoader.load(next_level)
	var instance = level.instantiate()
	get_tree().root.add_child(instance)
	get_tree().current_scene = instance
	player.position = Vector2(280,290)

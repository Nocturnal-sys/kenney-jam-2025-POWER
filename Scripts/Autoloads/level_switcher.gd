extends Node

var current_level : Level = null


func _ready() -> void:
	current_level = get_tree().root.get_child(-1)

#called from level to switch to next level
func advance_level(next : String):
	_deferred_goto_level.call_deferred(next)


func _deferred_goto_level(path : String):
	current_level.free()
	var level = ResourceLoader.load(path)
	current_level = level.instantiate()
	get_tree().root.add_child(current_level)
	get_tree().current_scene = current_level

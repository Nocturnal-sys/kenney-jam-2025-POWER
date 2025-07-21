extends Node

var current_level : Level = null


func _ready() -> void:
	current_level = get_tree().root.get_child(-1)

#called from level to switch to next level
func advance_level(next : String):
	_deferred_goto_level.call_deferred(next)


func reset_level():
	_deferred_reset_level.call_deferred()


func _deferred_reset_level():
	get_tree().reload_current_scene()


	#get the current version of the main scene and free it, before loading
	#the next scene, which is stored in the level's "next" variable and
	#passed to this function
func _deferred_goto_level(path : String):
	current_level = get_tree().root.get_child(-1)
	current_level.free()
	var level = ResourceLoader.load(path)
	current_level = level.instantiate()
	get_tree().root.add_child(current_level)
	get_tree().current_scene = current_level
	

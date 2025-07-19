extends Node
class_name Cog

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D 

func toggle_animation() -> void:
	if animated_sprite.is_playing():
		animated_sprite.pause()
	else:
		animated_sprite.play()

func is_spinning() -> bool:
	if animated_sprite.is_playing():
		return true
	return false

class_name Door
extends StaticBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func play_animation() -> void:
	animated_sprite.play()

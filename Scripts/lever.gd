extends Area2D

@onready var lever: Area2D = $"."
@onready var path: PathFollow2D = $Path2D/PathFollow2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

signal lever_toggled()

func _process(delta: float) -> void:
	path.progress_ratio += 1 * delta

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact") and lever.has_overlapping_bodies():
		lever_toggled.emit()
		if animated_sprite.frame > 0:
			animated_sprite.frame -= 1
		else:
			animated_sprite.frame += 1

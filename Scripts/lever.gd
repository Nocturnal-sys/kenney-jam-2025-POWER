extends Area2D

@onready var lever: Area2D = $"."
@onready var path: PathFollow2D = $Path2D/PathFollow2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var prompt: Sprite2D = $Path2D/PathFollow2D/InputPrompt

signal lever_toggled()


func _process(delta: float) -> void:
	path.progress_ratio += 1 * delta


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact") and lever.has_overlapping_bodies():
		AudioManager.play_lever()
		lever_toggled.emit()
		if animated_sprite.frame > 0:
			animated_sprite.frame -= 1
		else:
			animated_sprite.frame += 1


func _on_body_entered(_body: Node2D) -> void:
	prompt.show()


func _on_body_exited(_body: Node2D) -> void:
	prompt.hide()

class_name Door
extends StaticBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var input_prompt: Sprite2D = $Path2D/PathFollow2D/InputPrompt
@onready var path: PathFollow2D = $Path2D/PathFollow2D


func _process(delta: float) -> void:
	path.progress_ratio += 1 * delta


func play_animation() -> void:
	animated_sprite.play()


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body is Player:
		input_prompt.show()


func _on_detection_area_body_exited(body: Node2D) -> void:
	input_prompt.hide()
